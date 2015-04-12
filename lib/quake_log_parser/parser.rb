module QuakeLogParser
  class Parser
    def initialize file_path
      @file_path = file_path  
    end
    
    def read
      File.open @file_path
    end
  end
end
