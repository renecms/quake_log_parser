# frozen_string_literal: true

class QuakeLogParser
  REGEX_KILL = /(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) Kill: (?<KillerID>\d*) (?<DeadId>\d*) (?<CODId>\d*): (?<Killer>\S*) killed (?<Dead>\S*) by (?<COD>\S*)/.freeze
  REGEX_ITEM = /(?<Hour>\d{1,2}):(?<Minutes>\d{1,2}) Item: (?<PlayerId>\d*) (?<Item>\S*)/.freeze

  def match_kill_line(line)
    line.match?(REGEX_KILL)
  end

  def match_item_line(line)
    line.match?(REGEX_ITEM)
  end
end
