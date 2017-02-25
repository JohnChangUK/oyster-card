require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    raise 'Maximum balance exceeded' if (balance + amount) > MAXIMUM_BALANCE
    @balance = balance + amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if balance < MINIMUM_BALANCE
    deduct(journeys.last.fare) if (!(journeys.empty?) && !(journeys.last.complete?) && in_journey?)
    @in_journey = true
    @journey = Journey.new(entry_station: entry_station)
    @journeys << journey
  end

  def touch_out(exit_station)
    @journey ||= Journey.new(entry_station: nil)
    @journey.finish(exit_station)
    deduct(journey.fare)
    @journeys << journey #unless journeys.include?(journey)
    @in_journey = false

  end

  def in_journey?
    @in_journey
    #!!(journey.entry_station)
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
