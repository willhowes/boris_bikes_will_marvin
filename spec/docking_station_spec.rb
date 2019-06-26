require './lib/docking_station.rb'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  describe '#release_bike' do
    it 'creates a Bike class when method is called' do
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end
    it 'releases working bikes' do
      expect(subject.release_bike).to be_working
    end
  end
end
