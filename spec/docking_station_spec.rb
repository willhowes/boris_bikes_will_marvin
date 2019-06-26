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

  describe "#receive_bike" do
    it "responds to receive_bike" do
      expect(subject).to respond_to(:receive_bike)
    end
  end

  it "stores the user's bike" do
    boris_bike = Bike.new
    expect(subject.receive_bike(boris_bike)).to include(boris_bike)
  end

  describe "@available_bikes" do
    it "lists all of the available bikes at the station" do
      station = DockingStation.new
      boris_bike = Bike.new
      station.receive_bike(boris_bike)
      expect(station.available_bikes).to eq([boris_bike])
    end
  end

end
