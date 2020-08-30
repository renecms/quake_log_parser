# frozen_string_literal: true

class Player
  def initialize(player_name, player_id)
    @player_name = player_name
    @player_id = player_id
    @kill_count = 0
  end

  def add_kill
    @kill_count += 1
  end

  def remove_kill
    @kill_count -= 1
  end

  attr_accessor :player_name, :player_id, :kill_count
end
