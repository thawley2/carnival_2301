require 'rspec'

RSpec.describe Carnival do
  before(:each) do
    carnival1 = Carnival.new({event_days: 4})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@carnival1).to be_a(Carnival)
    end

    it 'has a number of days the carnival will be' do
      expect(@carnival1.event_days).to eq(4)
    end
    
    it 'starts with an emtpy list of rides' do
      expect(@carnival1.rides).to eq([])
    end
  end
end