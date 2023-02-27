require 'rspec'

RSpec.describe Carnival do
  before(:each) do
    @carnival1 = Carnival.new({name: "The Greatest Show", event_days: 4})

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

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Thomas', 55, '$15')
    @visitor4 = Visitor.new('Penny', 64, '$15')

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)
    @visitor3.add_preference(:gentle)
    @visitor4.add_preference(:gentle)
    @visitor4.add_preference(:thrilling)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@carnival1).to be_a(Carnival)
    end

    it 'has a name' do
      expect(@carnival1.name).to eq("The Greatest Show")
    end

    it 'has a number of days the carnival will be' do
      expect(@carnival1.event_days).to eq(4)
    end

    it 'starts with an emtpy list of rides' do
      expect(@carnival1.rides).to eq([])
    end
  end

  describe '#add_ride' do
    it 'can add rides to the carnival' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe '#ride_ride' do
    it 'a visitor can ride a ride at the carnival if the ride has been added' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)

      expect(@carnival1.ride_ride(@visitor4, @ride1)).to eq("Weeee")
      expect(@carnival1.ride_ride(@visitor4, @ride3)).to eq("That ride does not exist here")
    end
  end

  describe '#most_popular_ride' do
    it 'can return the name of the most popular ride at the carnival' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @carnival1.ride_ride(@visitor1, @ride1)
      @carnival1.ride_ride(@visitor2, @ride1)
      @carnival1.ride_ride(@visitor3, @ride1)
      @carnival1.ride_ride(@visitor4, @ride1)

      @carnival1.ride_ride(@visitor1, @ride2)
      @carnival1.ride_ride(@visitor3, @ride2)
      @carnival1.ride_ride(@visitor4, @ride2)
      
      @carnival1.ride_ride(@visitor1, @ride3)
      @carnival1.ride_ride(@visitor3, @ride3)
      @carnival1.ride_ride(@visitor4, @ride3)

      expect(@carnival1.most_popular_ride).to eq('Carousel')
    end

    it 'can return the name of the most popular ride if it is a different ride' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @carnival1.ride_ride(@visitor1, @ride1)
      @carnival1.ride_ride(@visitor2, @ride1)
      @carnival1.ride_ride(@visitor3, @ride1)
      

      @carnival1.ride_ride(@visitor1, @ride2)
      @carnival1.ride_ride(@visitor3, @ride2)
      @carnival1.ride_ride(@visitor4, @ride2)
      @carnival1.ride_ride(@visitor4, @ride2)
      
      @carnival1.ride_ride(@visitor1, @ride3)
      @carnival1.ride_ride(@visitor3, @ride3)
      @carnival1.ride_ride(@visitor4, @ride3)

      expect(@carnival1.most_popular_ride).to eq('Ferris Wheel')
    end
  end
end