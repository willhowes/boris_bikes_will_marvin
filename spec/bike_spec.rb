
require 'Bike'

describe Bike do
  it 'responds to working?' do
    expect(subject).to respond_to :working?
  end
  describe '#report_broken'
    bike = Bike.new
    bike.report_broken
    it 'report bike as broken' do
      expect(bike.broken?).to eq true
    end
end
