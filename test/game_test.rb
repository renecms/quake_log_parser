require_relative '../src/model/game'
require_relative '../src/model/kill_info'
require 'minitest/autorun'
require 'test_helper'

class GameTest < Minitest::Test
  def test_game
    game = Game.new

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

  def test_game_report
    game = Game.new
    game.update_kill_count(kill_info('<world>', 'thor'))
    game.update_kill_count(kill_info('thor', 'thanos'))
    game.update_kill_count(kill_info('thor', 'thanos'))
    game.update_kill_count(kill_info('thor', 'thanos'))
    game.update_kill_count(kill_info('thor', 'thanos'))
    game.update_kill_count(kill_info('ironman', 'thanos'))
    game.update_kill_count(kill_info('ironman', 'thanos'))
    game.update_kill_count(kill_info('thanos', 'ironman'))
    game.update_kill_count(kill_info('thanos', 'ironman'))
    game.update_kill_count(kill_info('thanos', 'ironman'))
    game.update_kill_count(kill_info('thanos', 'ironman'))
    assert_equal('{"total_kill"=>9, "players"=>["thor", "thanos", "ironman"], "kills"=>{"thor"=>3, "thanos"=>4, "ironman"=>2}}',
                 game.game_report.to_s)
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