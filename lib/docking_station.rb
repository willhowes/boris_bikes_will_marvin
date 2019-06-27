DockingStation = Class.new

class DockingStation

  attr_reader :available_bikes

  def initialize
    @available_bikes = []
    @capacity = 1
  end

  def release_bike
    raise "No Bikes Available" if @available_bikes == []
    Bike.new
  end

  def full?
    if @available_bikes.length >= @capacity
      true
    end
  end

    def receive_bike(bike)
      if full?
        raise "Docking Station full"
      else
        @available_bikes << bike
      end
    end
end
