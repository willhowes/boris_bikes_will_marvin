
require 'Bike'

describe Bike do
  it 'responds to working?' do
    expect(subject).to respond_to :working?
  end
  describe '#broken'
    bike = Bike.new
    it 'report bike as broken' do
      expect(bike.broken).to eq true
    end
end
