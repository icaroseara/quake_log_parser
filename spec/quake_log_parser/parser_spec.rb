require 'spec_helper'

describe QuakeLogParser::Parser do
  let(:parser) { QuakeLogParser::Parser.new("lib/quake_log_parser/support/games.log") }
  
  describe "#read" do
    it { expect(parser.read).to have(235625).item}
    it { expect(parser.read.lines).to have(5306).lines }
  end
  
  describe "#parse" do
    before { parser.parse }
    
    describe "get number of games" do
      it { expect(parser.games).to have(21).games}      
    end
  end
  
  describe "initgame?" do
    it{ expect(parser.send(:initgame?, "  0:00 InitGame: \\sv_floodProtect\\1\\sv_maxPing\\0\\sv_minPing\\0\\sv_maxRate\\10000\\sv_minRate\\0\\sv_hostname\\Code Miner Server\\g_gametype\\0\\sv_privateClients\\2\\sv_maxclients\\16\\sv_allowDownload\\0\\dmflags\\0\\fraglimit\\20\\timelimit\\15\\g_maxGameClients\\0\\capturelimit\\8\\version\\ioq3 1.36 linux-x86_64 Apr 12 2009\\protocol\\68\\mapname\\q3dm17\\gamename\\baseq3\\g_needpass\\0\n")).to be_truthy }
    it{ expect(parser.send(:initgame?, " 20:38 ClientBegin: 2")).to be_falsy }    
  end
end
