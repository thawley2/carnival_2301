require 'rspec'

RSpec.describe Carnival do
  before(:each) do
    @carnival1 = Carnival.new({event_days: 4})

    @ride1 = Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle 
      })
    @ride2 = Ride.new({ 
        name: 'Ferris Wheel', 
        min_height: 36, 
        admission_fee: 5, 
        excitement: :gentle 
        })

    @ride3 = Ride.new({ 
        name: 'Roller Coaster', 
        min_height: 54, 
        admission_fee: 2, 
        excitement: :thrilling 
        })
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

  describe '#add_rides' do
    it 'can add rides to the carnival' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
    end
  end
end