require_relative '../src/model/game'
require_relative '../src/model/kill_info'
require_relative '../src/model/player'
require 'minitest/autorun'
require 'test_helper'

class GameTest < Minitest::Test
  def test_game
    game = Game.new('17:12')
    game.update_kill_count(kill_info('<world>', 'thor'))
    assert_equal(-1, game.players['thor'].kill_count)
    assert_equal(1, game.players.size)
    assert_nil(game.players['<world>'])
    game.update_kill_count(kill_info('thor', 'thanos'))
    assert_equal(0, game.players['thor'].kill_count)
    assert_equal(0, game.players['thanos'].kill_count)
    assert_equal(2, game.players.size)
    game.update_kill_count(kill_info('thor', 'thanos'))
    assert_equal(1, game.players['thor'].kill_count)
    assert_equal(0, game.players['thanos'].kill_count)
    assert_equal(2, game.players.size)
  end

  def kill_info(p1, p2)
    kill = KillInfo.new
    kill.killer = p1
    kill.killer_id = 1
    kill.dead = p2
    kill.dead_id = 2
    kill
  end
end