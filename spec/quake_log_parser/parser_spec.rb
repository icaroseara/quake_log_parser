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
  
  describe "player_info?" do
    it{ expect(parser.send(:player_info?,  " 20:34 ClientUserinfoChanged: 2 n\\Isgalamido\\t\\0\\model\\xian/default\\hmodel\\xian/default\\g_redteam\\\\g_blueteam\\\\c1\\4\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0\n")).to be_truthy }
    it{ expect(parser.send(:player_info?,  " 20:38 ClientBegin: 2")).to be_falsy }    
  end
  
  describe "player_info" do
    context "with valid params" do
      let(:player_info){ parser.send(:player_info, " 20:34 ClientUserinfoChanged: 2 n\\Isgalamido\\t\\0\\model\\xian/default\\hmodel\\xian/default\\g_redteam\\\\g_blueteam\\\\c1\\4\\c2\\5\\hc\\100\\w\\0\\l\\0\\tt\\0\\tl\\0\n") }
      
      describe "player_id" do
        it { expect(player_info[:player_id]).to eq("2")}
      end
      
      describe "player_name" do
        it { expect(player_info[:player_name]).to eq("Isgalamido")}
      end
    end
    
    context "with invalid params" do
      let(:player_info){ parser.send(:player_info, " 20:38 ClientBegin: 2") }
      it{ expect(player_info).to eq nil }    
    end
  end
  
  describe "kill?" do
    it{ expect(parser.send(:kill?, " 20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT\n")).to be_truthy }
    it{ expect(parser.send(:kill?, " 20:38 ClientBegin: 2")).to be_falsy }    
  end
  
  describe "kill_info" do
    context "with valid params" do
      let(:kill_info){ parser.send(:kill_info, " 20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT\n") }
      
      describe "killer_id" do
        it{ expect(kill_info[:killer_id]).to eq("1022") }    
      end
      
      describe "victim_id" do
        it{ expect(kill_info[:victim_id]).to eq("2") }    
      end
      
      describe "mean_of_death_id" do
        it{ expect(kill_info[:mean_of_death_id]).to eq("22") } 
      end
    end 
    
    context "with invalid params" do
      let(:kill_info){ parser.send(:kill_info, " 20:38 ClientBegin: 2") }
      it{ expect(kill_info).to eq nil }    
    end       
  end
end
