require "quake_log_parser/string_helper"

module QuakeLogParser
  class Parser    
    include StringHelper
    
    attr_accessor :games
    
    def initialize file_path
      @file_path = file_path  
      @games = []
    end
    
    def read
      File.open @file_path
    end
    
    def parse
      counter = 0
      read.each_line do |line|
        case
        when initgame?(line)
          @games << QuakeLogParser::Game.new(counter)
          counter += 1
        when player_info?(line)
          player = Player.new(player_info(line)[:player_id], player_info(line)[:player_name])
          @games.last.add_player(player)
        when kill?(line)
          victim = @games.last.get_player_by_id(kill_info(line)[:victim_id])
          @games.last.increase_kills(kill_info(line)[:mean_of_death_id])
          if Player.world?(kill_info(line)[:killer_id])
            victim.killed_by_world
          else
            killer = @games.last.get_player_by_id(kill_info(line)[:killer_id])
            victim.killed_by killer            
          end
        end   
      end
    end
    
    def scoreboard
      @games.inject(Hash.new) { |h, g| h[g.name] = g.to_json; h }
    end
  end
end
