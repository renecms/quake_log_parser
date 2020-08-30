# frozen_string_literal: true

class KillInfo
  def initialize
    super
  end

  def self.from_log(extracted_log)
    info = KillInfo.new
    info.time = extracted_log[:Time]
    info.killer_id = extracted_log[:KillerId]
    info.dead_id = extracted_log[:DeadId]
    info.cod_id = extracted_log[:CoD_Id]
    info.killer = extracted_log[:Killer]
    info.dead = extracted_log[:Dead]
    info.cod = extracted_log[:CoD]
    info
  end

  attr_accessor :time, :killer_id, :dead_id, :cod_id, :killer, :dead, :cod
end
