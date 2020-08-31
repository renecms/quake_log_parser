# frozen_string_literal: true

require_relative '../src/quake_log_parser'
require 'minitest/autorun'
require 'test_helper'
require 'json'

class QuakeLogParserTest < Minitest::Test
  def setup
    super
    @parser = QuakeLogParser.new
  end

  def test_kill_parser_success
    assert_equal true, @parser.match_kill_line('  20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT  ')
  end

  def test_kill_parser_fail
    assert_equal false, @parser.match_kill_line('  20:40 Item: 2 weapon_rocketlauncher ')
  end

  def test_item_parser_success
    assert_equal true, @parser.match_item_line('  20:40 Item: 2 weapon_rocketlauncher ')
  end

  def test_item_parser_fail
    assert_equal false, @parser.match_item_line('  20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT ')
  end

  def test_kill_extraction
    extracted_info = @parser.extract_kill_info('  20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT')
    assert_equal '20:54', extracted_info.time
    assert_equal '1022', extracted_info.killer_id
    assert_equal '2', extracted_info.dead_id
    assert_equal '22', extracted_info.cod_id
    assert_equal '<world>', extracted_info.killer
    assert_equal 'Isgalamido', extracted_info.dead
    assert_equal 'MOD_TRIGGER_HURT', extracted_info.cod
  end

  def test_parse_file
    report = QuakeLogParser.new.parse_file('qgames.log')
    puts JSON.pretty_generate(report)
  end

end
