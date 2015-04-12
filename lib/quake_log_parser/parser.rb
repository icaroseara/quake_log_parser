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
        end    
      end
    end
  end
end
