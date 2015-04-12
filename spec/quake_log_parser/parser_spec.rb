require 'spec_helper'

describe QuakeLogParser::Parser do
  let(:parser) { QuakeLogParser::Parser.new("lib/quake_log_parser/support/games.log") }
  
  describe "#read" do
    it { expect(parser.read).to have(235625).item}
    it { expect(parser.read.lines).to have(5306).lines }
  end
  
  describe "#parse" do
    before { parser.parse }
  end
end
