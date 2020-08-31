# frozen_string_literal: true

require_relative 'kill_info'
require 'json'

class Game
  attr_accessor :players, :deaths_by_type
  Player = Struct.new(:kill, :death)

  def initialize
    @players = {}
    @deaths_by_type = {}
    @total_kills = 0
  end

  def update_death(death_type)
    @deaths_by_type[death_type] = 0 unless @deaths_by_type.key?(death_type)
    @deaths_by_type[death_type] += 1
  end

  def update_kill_count(kill_info)
    if kill_info.killer == '<world>'
      @players[kill_info.dead] = Player.new(0, 0) unless @players.key?(kill_info.dead)
      @players[kill_info.dead].kill -= 1
    else
      @players[kill_info.killer] = Player.new(0, 0) unless @players.key?(kill_info.killer)
      @players[kill_info.dead] = Player.new(0, 0) unless @players.key?(kill_info.dead)
      @players[kill_info.killer].kill += 1
    end
    @total_kills += 1
    @players[kill_info.dead].death += 1
    update_death(kill_info.cod)
  end

  def game_report
    {
        'total_kill' => @total_kills,
        'players' => @players.keys,
        'kills' => @players
                       .sort_by { |_k, v| v.kill }
                       .reverse
                       .to_h
                       .map { |k, v| [k, {'kills' => v.kill.to_s, 'deaths' => v.death.to_s}] }
                       .to_h,
        'most_kills' => @players.key(@players.values.max_by(&:kill)),
        'most_deaths' => @players.key(@players.values.max_by(&:death))
    }
  end
end
