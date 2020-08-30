# frozen_string_literal: true

class KillInfo
  def initialize(extracted_log)
    @time = extracted_log[:Time]
    @killer_id = extracted_log[:KillerId]
    @dead_id = extracted_log[:DeadId]
    @cod_id = extracted_log[:CoD_Id]
    @killer = extracted_log[:Killer]
    @dead = extracted_log[:Dead]
    @cod = extracted_log[:CoD]
  end

  attr_accessor :time, :killer_id, :dead_id, :cod_id, :killer, :dead, :cod
end
