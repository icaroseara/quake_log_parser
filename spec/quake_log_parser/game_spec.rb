require 'spec_helper'

describe QuakeLogParser::Game do
  let(:id) { rand(100).to_s }
  let(:game) { QuakeLogParser::Game.new(id) }
  
  describe "name" do
    it { expect(game.name).to eq("game_#{id}") }
  end
end
