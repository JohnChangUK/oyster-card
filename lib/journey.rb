require 'oystercard'

class Journey

  attr_reader :entry_station, :exit_station, :complete
  PENALTY_FARE = 6

  def initialize(station = {})
    @entry_station = station[:entry_station]
    @complete = false
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    self
  end

  def fare
    complete? ? Oystercard::MINIMUM_BALANCE : PENALTY_FARE
  end

  def complete?
    !!(exit_station)
  end

end
