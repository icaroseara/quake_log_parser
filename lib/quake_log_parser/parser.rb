module QuakeLogParser
  class Parser    
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
        # TODO add added parse rules
      end
    end
  end
end
