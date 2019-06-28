# frozen_string_literal: true

DockingStation = Class.new

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'Docking Station Empty' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station full' if full?
    @bikes << bike
  end

  private

  def full?
    true if @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
