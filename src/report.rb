require_relative 'quake_log_parser'

parser = QuakeLogParser.new
parser.parse_file(ARGV[0])
puts JSON.pretty_generate(parser.log_report)
