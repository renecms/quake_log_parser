# frozen_string_literal: true

class QuakeLogParser
  REGEX_KILL = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) Kill: (?<KillerId>\d*) (?<DeadId>\d*) (?<CoD_Id>\d*): (?<Killer>\S*) killed (?<Dead>\S*) by (?<CoD>\S*)$/.freeze
  REGEX_ITEM = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) Item: (?<PlayerId>\d*) (?<Item>\S*)$/.freeze
  REGEX_INIT_GAME = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) InitGame: (?<GameConfig>\.*)$/.freeze
  REGEX_CLIENT_CONNECTED = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) ClientConnect: (?<PlayerId>\d*)$/.freeze
  REGEX_CLIENT_INFO_CHANGED = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) ClientUserinfoChanged: (?<PlayerId>\d*) (?<UserInfo>\S*)$/.freeze
  REGEX_CLIENT_BEGIN = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) ClientBegin: (?<PlayerId>\d*)$/.freeze
  REGEX_SHUTDOWN_GAME = /^(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) ShutdownGame:$/.freeze

  def match_kill_line(line)
    line.match?(REGEX_KILL)
  end

  def extract_kill_info(line)
    line.match(REGEX_KILL)
  end

  def match_item_line(line)
    line.match?(REGEX_ITEM)
  end
end
