module QuakeLogParser
  class Player
    attr_accessor :name, :id, :kills, :deaths

    def initialize(id, name)
      @id = id
      @name = name
      @kills = 0
      @deaths = 0
    end

    def performance
      { kills: @kills, deaths: @deaths }
    end

    def killed_by_world
      @kills -= 1
    end

    def killed_by(killer)
      @deaths += 1
      killer.kills += 1
    end

    def self.world?(player_id)
      player_id == '1022'
    end
  end
end
