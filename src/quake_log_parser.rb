# frozen_string_literal: true

class QuakeLogParser
  def parse_line(_line)
    1
  end
end

puts QuakeLogParser.new.parse_line(1)
