class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise 'Maximum balance exceeded' if (balance + amount) > MAXIMUM_BALANCE
    @balance = balance + amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    deduct(MINIMUM_CHARGE)
    @journeys << {entry_station: self.entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  def in_journey?
    !!(entry_station)
  end

  private
  
  def deduct(fare)
    @balance -= fare
  end

end




# require_relative 'journey'
#
# class Oystercard
#
#   LIMIT = 90
#   MINIMUM_BALANCE = 1
#   MINIMUM_FARE = 2.50
#
#   attr_reader :balance, :entry_station, :all_journeys
#
#   def initialize(balance = 0)
#     @balance = balance
#     @all_journeys = []
#   end
#
#   def top_up(money)
#     raise "#{money} pushes your balance over the £#{LIMIT} limit." if money + @balance > LIMIT
#     @balance += money
#   end
#
#   def touch_in(entry_station)
#     raise "Not enough money." if @balance < MINIMUM_BALANCE
#     deduct()
#     @journey.start_journey(entry_station)
#     @all_journeys << @journey
#     @entry_station = entry_station
#   end
#
#   def touch_out(exit_station)
#     @journey ||= Journey.new
#     @journey.end_journey(exit_station)
#     @all_journeys << @journey unless @all_journeys.include?(@journey)
#     deduct(@journey.fare)
#     @entry_station = nil
#   end
#
#   def in_journey?
#     !!@entry_station
#   end
#
#   private
#
#   def deduct(fare)
#     @balance -= fare
#   end
#
# end
#
# # card = Oystercard.new
# # card.top_up(40)
# # card.touch_in("Whitechapel")
# #
# # card.touch_out("shoreditch")
# # p "All Journeys: #{card.all_journeys}"
# #
# #
# # p card.touch_in("Penge")
# #
# # p card.touch_out("Bank")
# #
# # card.all_journeys
