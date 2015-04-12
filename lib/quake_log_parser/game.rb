module QuakeLogParser
  class Game
    attr_accessor :name, :players, :total_kills, :means_of_death
    
    def initialize index
      @name = "game_#{index}"
      @total_kills = 0
      @players = []
      @means_of_death = {}
    end
  end
end