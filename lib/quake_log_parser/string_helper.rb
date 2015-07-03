module QuakeLogParser::StringHelper
  def initgame?(string_log)
    string_log.match(/InitGame:/) ? true : false
  end

  def kill?(string_log)
    string_log.match(/Kill:/) ? true : false
  end

  def player_info?(string_log)
    string_log.match(/ClientUserinfoChanged:/) ? true : false
  end

  def player_info(string_log)
    string_log.match(/\s(?<player_id>\d+)\sn\\(?<player_name>[\s\w]+[^\t])\\t/)
  end

  def kill_info(string_log)
    string_log.match(/(?<killer_id>\d+)\s(?<victim_id>\d+)\s(?<mean_of_death_id>\d+)/)
  end
end
