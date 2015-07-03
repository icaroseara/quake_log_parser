module QuakeLogParser
  class Game
    attr_accessor :name, :players, :total_kills, :means_of_death

    def initialize(index)
      @name = "game_#{index}"
      @total_kills = 0
      @players = []
      @means_of_death = {}
    end

    def add_player(player)
      @players << player unless include_player? player
    end

    def players_names
      @players.map(&:name).uniq
    end

    def get_player_by_id(player_id)
      @players.find { |p| p.id == player_id }
    end

    def players_performance
      @players.inject({}) { |h, p| h[p.name] = p.performance; h }
    end

    def increase_kills(means_of_death_id)
      unless QuakeLogParser::MEANS_OF_DEATH[means_of_death_id.to_i].nil?
        @means_of_death[QuakeLogParser::MEANS_OF_DEATH[means_of_death_id.to_i]] = 0 unless @means_of_death.key? QuakeLogParser::MEANS_OF_DEATH[means_of_death_id.to_i]
        @means_of_death[QuakeLogParser::MEANS_OF_DEATH[means_of_death_id.to_i]] += 1
        @total_kills += 1
      end
    end

    def to_json
      {
        total_kills: @total_kills,
        players: players_names,
        kills: players_performance,
        kills_by_means: @means_of_death
      }
    end

    private

    def include_player?(player)
      @players.map(&:name).include? player.name
    end
  end
end
