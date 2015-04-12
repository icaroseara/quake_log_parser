require 'spec_helper'

describe QuakeLogParser::Player do
  let(:player) { QuakeLogParser::Player.new(2, "Isgalamido") }
  let(:different_player) { QuakeLogParser::Player.new(3, "Dono da Bola") }
  let(:killed_by_world) { player.killed_by_world }
  let(:killed_by) { player.killed_by(different_player) }
  
  describe ".world?" do
    it{ expect(QuakeLogParser::Player.world?(player.id)).to be_falsy }
    it{ expect(QuakeLogParser::Player.world?("1022")).to be_truthy }
  end
  
  describe "#killed_by_world" do
    before { killed_by_world }  
    describe "kills" do
      it { expect(player.kills).to eq(-1) }
    end
  end
  
  describe "#killed_by" do
    before { killed_by }
    
    describe "kills" do
      it { expect(different_player.kills).to eq(1) }
    end
    
    describe "deaths" do
      it { expect(player.deaths).to eq(1) }
    end
  end
  
  describe "#killed_by" do
    before { killed_by }
    
    describe "kills" do
      it { expect(player.performance[:kills]).to eq(0) }
      it { expect(different_player.performance[:kills]).to eq(1) }
    end
    
    describe "deaths" do
      it { expect(player.performance[:deaths]).to eq(1) }
      it { expect(different_player.performance[:deaths]).to eq(0) }
    end
  end
end
