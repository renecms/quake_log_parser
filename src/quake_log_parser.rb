# frozen_string_literal: true
require_relative 'model/kill_info'
require_relative 'model/game'

class QuakeLogParser
  REGEX_KILL = /(?<Time>\d{1,2}:\d{1,2}) Kill: (?<KillerId>\d*) (?<DeadId>\d*) (?<CoD_Id>\d*): (?<Killer>\S*) killed (?<Dead>\S*) by (?<CoD>\S*)/.freeze
  REGEX_ITEM = /(?<Time>\d{1,2}:\d{1,2}) Item: (?<PlayerId>\d*) (?<Item>\S*)/.freeze
  REGEX_INIT_GAME = /(?<Time>\d{1,2}:\d{1,2}) InitGame: (?<GameConfig>\.*)/.freeze
  REGEX_CLIENT_CONNECTED = /(?<Time>\d{1,2}:\d{1,2}) ClientConnect: (?<PlayerId>\d*)/.freeze
  REGEX_CLIENT_INFO_CHANGED = /(?<Time>\d{1,2}:\d{1,2}) ClientUserinfoChanged: (?<PlayerId>\d*) (?<UserInfo>\S*)/.freeze
  REGEX_CLIENT_BEGIN = /(?<Time>\d{1,2}:\d{1,2}) ClientBegin: (?<PlayerId>\d*)/.freeze
  REGEX_SHUTDOWN_GAME = /(?<Time>\d{1,2}:\d{1,2}) ShutdownGame:/.freeze

  attr_accessor :games

  def initialize
    @games = []
  end

  def parse_file(path)
    current_game = Game.new
    File.readlines(path).each do |line|
      current_game = Game.new if match_init_game(line)
      current_game.update_kill_count(extract_kill_info(line)) if match_kill_line(line)
      @games.append(current_game) if match_shutdown_game(line)
    end
    @games.each { |game| puts game.game_report }
  end

  def match_kill_line(line)
    line.match?(REGEX_KILL)
  end

  def extract_kill_info(line)
    KillInfo.from_log(line.match(REGEX_KILL))
  end

  def match_item_line(line)
    line.match?(REGEX_ITEM)
  end

  def match_init_game(line)
    line.match?(REGEX_INIT_GAME)
  end

  def match_shutdown_game(line)
    line.match?(REGEX_SHUTDOWN_GAME)
  end


end
