# frozen_string_literal: true

require_relative '../src/quake_log_parser'
require 'minitest/autorun'
require 'test_helper'

class QuakeLogParserTest < Minitest::Test
  def test_single_kill_line
    assert_equal 1, QuakeLogParser.new.parse_line('20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT')
  end
end
