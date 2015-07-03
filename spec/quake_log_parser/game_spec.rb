require 'spec_helper'

describe QuakeLogParser::Game do
  let(:id) { rand(100).to_s }
  let(:mod_trigger_hurt_id) { 22 }
  let(:mod_rail_gun_id) { 10 }
  let(:game) { QuakeLogParser::Game.new(id) }
  let(:player) { QuakeLogParser::Player.new(2, 'Isgalamido') }
  let(:different_player) { QuakeLogParser::Player.new(3, 'Dono da Bola') }
  let(:add_player) { game.add_player(player) }
  let(:add_different_player) { game.add_player(different_player) }
  let(:increase_kills_by_code) { game.increase_kills(mod_trigger_hurt_id) }
  let(:increase_kills_with_different_id) { game.increase_kills(mod_rail_gun_id) }

  describe 'name' do
    it { expect(game.name).to eq("game_#{id}") }
  end

  describe '#add_player' do
    let(:add_same_player) { game.add_player(player) }
    before { add_player }

    context 'when is first player' do
      it { expect(game.players).to have(1).players }
    end

    context 'when the player was already added' do
      before { add_same_player }
      it { expect(game.players).to have(1).players }
    end

    context 'with a different player' do
      before { add_different_player }
      it { expect(game.players).to have(2).players }
    end
  end

  describe '#players_names' do
    before do
      add_player
      add_different_player
    end
    it { expect(game.players_names).to include('Isgalamido', 'Dono da Bola') }
  end

  describe '#get_player_by_id' do
    before { add_player }

    context 'when the player is valid' do
      it { expect(game.get_player_by_id(player.id)).to be_kind_of(QuakeLogParser::Player) }
    end

    context 'when the player is invalid' do
      it { expect(game.get_player_by_id(different_player.id)).to_not be_kind_of(QuakeLogParser::Player) }
      it { expect(game.get_player_by_id(different_player.id)).to be_nil }
    end
  end

  describe '#players_performance' do
    before { add_player }

    context "when player hasn't performance information" do
      describe 'kills information' do
        it { expect(game.players_performance[player.name][:kills]).to eq(0) }
      end

      describe 'kills information' do
        it { expect(game.players_performance[player.name][:deaths]).to eq(0) }
      end
    end

    context "when player hasn't performance information" do
      before { player.killed_by(different_player)  }

      describe 'kills information' do
        it { expect(game.players_performance[player.name][:kills]).to eq(0) }
      end

      describe 'kills information' do
        it { expect(game.players_performance[player.name][:deaths]).to eq(1) }
      end
    end
  end

  describe '#increase_kills' do
    let(:increase_kills_with_same_id) { game.increase_kills(mod_trigger_hurt_id) }

    before { increase_kills_by_code }

    context 'when the means_of_death_id is valid' do
      describe 'first record' do
        it { expect(game.total_kills).to eq(1) }
        it { expect(game.means_of_death[QuakeLogParser::MEANS_OF_DEATH[mod_trigger_hurt_id]]).to eq(1) }
      end

      describe 'another record' do
        before { increase_kills_with_same_id }
        it { expect(game.total_kills).to eq(2) }
        it { expect(game.means_of_death[QuakeLogParser::MEANS_OF_DEATH[mod_trigger_hurt_id]]).to eq(2) }
      end

      describe 'with different means_of_death_id' do
        before { increase_kills_with_different_id }
        it { expect(game.total_kills).to eq(2) }
        it { expect(game.means_of_death[QuakeLogParser::MEANS_OF_DEATH[mod_trigger_hurt_id]]).to eq(1) }
        it { expect(game.means_of_death[QuakeLogParser::MEANS_OF_DEATH[mod_rail_gun_id]]).to eq(1) }
      end
    end

    context 'when the means_of_death_id is invalid' do
      let(:means_of_death_id) { 100 }
      let(:increase_kills_by_code) { game.increase_kills(means_of_death_id) }

      it { expect(game.total_kills).to eq(0) }
    end
  end

  describe '#to_json' do
    let(:to_json) { game.to_json }

    before do
      add_player
      add_different_player
      increase_kills_by_code
      increase_kills_with_different_id
    end

    it { expect(to_json[:total_kills]).to eq(2) }
    it { expect(to_json[:players]).to include('Isgalamido', 'Dono da Bola') }
    it { expect(to_json[:kills_by_means]).to include('MOD_TRIGGER_HURT', 'MOD_RAILGUN') }
    it { expect(to_json[:kills]).to include('Isgalamido', 'Dono da Bola') }
  end
end
