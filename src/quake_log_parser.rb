# frozen_string_literal: true
require_relative 'model/kill_info'

class QuakeLogParser
  REGEX_KILL = /^(?<Time>\d{1,2}:\d{1,2}) Kill: (?<KillerId>\d*) (?<DeadId>\d*) (?<CoD_Id>\d*): (?<Killer>\S*) killed (?<Dead>\S*) by (?<CoD>\S*)$/.freeze
  REGEX_ITEM = /^(?<Time>\d{1,2}:\d{1,2}) Item: (?<PlayerId>\d*) (?<Item>\S*)$/.freeze
  REGEX_INIT_GAME = /^(?<Time>\d{1,2}:\d{1,2}) InitGame: (?<GameConfig>\.*)$/.freeze
  REGEX_CLIENT_CONNECTED = /^(?<Time>\d{1,2}:\d{1,2}) ClientConnect: (?<PlayerId>\d*)$/.freeze
  REGEX_CLIENT_INFO_CHANGED = /^(?<Time>\d{1,2}:\d{1,2}) ClientUserinfoChanged: (?<PlayerId>\d*) (?<UserInfo>\S*)$/.freeze
  REGEX_CLIENT_BEGIN = /^(?<Time>\d{1,2}:\d{1,2}) ClientBegin: (?<PlayerId>\d*)$/.freeze
  REGEX_SHUTDOWN_GAME = /^(?<Time>\d{1,2}:\d{1,2}) ShutdownGame:$/.freeze

  def match_kill_line(line)
    line.match?(REGEX_KILL)
  end

  def extract_kill_info(line)
    KillInfo.new(line.match(REGEX_KILL))
  end

  def match_item_line(line)
    line.match?(REGEX_ITEM)
  end
end
