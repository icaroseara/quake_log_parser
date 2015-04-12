module QuakeLogParser::StringHelper
  def initgame? string_log
    string_log.match(/InitGame:/) ? true : false
  end   
end