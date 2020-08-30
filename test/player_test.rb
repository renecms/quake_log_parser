require_relative '../src/model/player'
require 'minitest/autorun'
require 'test_helper'

class PlayerTest < Minitest::Test
  def test_player_kill_count_updates
    player = Player.new('Rene', 1)
    assert_equal 1, player.add_kill
    assert_equal 2, player.add_kill
    assert_equal 1, player.remove_kill
    assert_equal 2, player.add_kill
    assert_equal 3, player.add_kill
    assert_equal 2, player.remove_kill
    assert_equal 1, player.remove_kill
    assert_equal 0, player.remove_kill
    assert_equal -1, player.remove_kill
    assert_equal -2, player.remove_kill
  end
end