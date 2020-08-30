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

  def test_kill_extraction
    extracted_info = QuakeLogParser.new.extract_kill_info('20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT')
    assert_equal '20', extracted_info[:Hour]
    assert_equal '54', extracted_info[:Minutes]
    assert_equal '1022', extracted_info[:KillerId]
    assert_equal '2', extracted_info[:DeadId]
    assert_equal '22', extracted_info[:CoD_Id]
    assert_equal '<world>', extracted_info[:Killer]
    assert_equal 'Isgalamido', extracted_info[:Dead]
    assert_equal 'MOD_TRIGGER_HURT', extracted_info[:CoD]
  end

end
