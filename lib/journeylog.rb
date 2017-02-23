class JourneyLog
  attr_reader :journeys

  def initialize(journey_class = Journey)
    @journey = journey_class
  end

  def start
  end

  def finish
  end

  def current_journey
  end


end
