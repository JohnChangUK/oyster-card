# require_relative 'journey'
#
# class JourneyLog
#
#   attr_reader :journey_class, :journeys
#
#   def initialize(journey_class = Journey.new )
#     @journey_class = journey_class
#     @journeys = []
#   end
#
#   def start(entry_station)
#     @journey_class.start(entry_station)
#   end
#
# end
#

class JourneyLog


  def initialize(journey_class:)
    #@journey_class = journey_class
  end

  def start(entry_station)
    @entry_station = entry_station
  end

end
