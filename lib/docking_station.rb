DockingStation = Class.new

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    if !empty?
        @bikes.pop()
    else
      raise "Docking Station Empty"
  end
  end

  def full?
    if @bikes.length >= @capacity
      true
    end
  end

    def dock(bike)
      if full?
        raise "Docking Station full"
      else
        @bikes << bike
      end
    end

    def empty?
      @bikes.empty?
    end
end
