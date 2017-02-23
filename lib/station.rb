
class Station
  attr_reader :name, :zone

  def initialize(station_information)
    @name = station_information[:name]
    @zone = station_information[:zone]
  end

end
