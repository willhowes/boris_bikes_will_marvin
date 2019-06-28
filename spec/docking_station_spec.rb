require './lib/docking_station.rb'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end
  it 'raises an error if docking station is empty' do
    docking_station_3 = DockingStation.new
    expect { docking_station_3.release_bike }.to raise_error 'Docking Station Empty'
  end

  describe '#release_bike' do
    subject(:station) do
      station = DockingStation.new
      station.dock(double(:bike))
      station
    end

    it 'creates a Bike class when method is called' do
      expect(station.release_bike).to be_an_instance_of(double(:bike))
    end

    it 'releases working bikes' do
      expect(station.release_bike).to be_working
    end
  end

  describe '#dock' do
    it 'responds to dock' do
      expect(subject).to respond_to(:dock).with(1).argument
    end
  end

  it "stores the user's bike" do
    boris_bike = double(:bike)
    expect(subject.dock(boris_bike)).to include(boris_bike)
  end

  describe '@bikes' do
    it 'lists all of the available bikes at the station' do
      station = DockingStation.new
      boris_bike = double(:bike)
      station.dock(boris_bike)
      expect(station.bikes).to eq([boris_bike])
    end
  end

  it 'raises an Error after 20 tries to dock bike' do
    new_station_2 = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { new_station_2.dock(double(:bike)) }
    expect { new_station_2.dock(double(:bike)) }.to raise_error 'Docking Station full'
  end

  it 'check if argument given matches the capacity' do
    new_station_3 = DockingStation.new(10)
    expect(new_station_3.capacity).to eq(10)
  end

  it 'Sets capacity to default capacity if no argument has been passed' do
    new_station_4 = DockingStation.new
    expect(new_station_4.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'Does not release broken bikes' do
    station_5 = DockingStation.new
    bike = double(:bike)
    bike.report_broken
    station_5.dock(bike)
    expect{station_5.release_bike}.to raise_error "Bike broken"
  end

end
