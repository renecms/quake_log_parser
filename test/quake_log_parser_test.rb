# frozen_string_literal: true

require_relative '../src/quake_log_parser'
require 'minitest/autorun'
require 'test_helper'

class QuakeLogParserTest < Minitest::Test
  def test_kill_parser_success
    assert_equal true, QuakeLogParser.new.match_kill_line('20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT')
  end

  def test_kill_parser_fail
    assert_equal false, QuakeLogParser.new.match_kill_line('20:40 Item: 2 weapon_rocketlauncher')
  end

  def test_item_parser_success
    assert_equal true, QuakeLogParser.new.match_item_line('20:40 Item: 2 weapon_rocketlauncher')
  end

  def test_item_parser_fail
    assert_equal false, QuakeLogParser.new.match_item_line('20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT')
  end

end
