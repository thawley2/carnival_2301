require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
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
      @visitor3 = Visitor.new('Thomas', 23, '$15')
      @visitor4 = Visitor.new('Penny', 64, '$15')

      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor3.add_preference(:extreme)
      @visitor2.add_preference(:thrilling)
      @visitor4.add_preference(:thrilling)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@ride1).to be_a(Ride)
    end

    it 'has a name' do
      expect(@ride1.name).to eq('Carousel')
    end

    it 'has a minimum height requirement' do
      expect(@ride1.min_height).to eq(24)
    end

    it 'has an admission fee' do
      expect(@ride1.admission_fee).to eq(1)
    end

    it 'has an excitement description' do
      expect(@ride1.excitement).to eq(:gentle)
    end

    it 'has total revenue earned that starts at 0' do
      expect(@ride1.total_revenue).to eq(0)
    end
  end

  describe '#board_rider' do
    it 'can check a rider if preferences match excitement' do
      expect(@ride1.match_preference(@visitor1)).to be true
      expect(@ride1.match_preference(@visitor3)).to be false
    end

    it 'can check a rider if they meet the height requirement' do
      expect(@ride1.meets_min_height(@visitor1)).to be true
      expect(@ride1.meets_min_height(@visitor3)).to be false
    end

    it 'can decrease rider money when they board a ride' do
      @ride1.charge_visitor_fee(@visitor1)

      expect(@visitor1.spending_money).to eq(9)

      @ride1.charge_visitor_fee(@visitor1)

      expect(@visitor1.spending_money).to eq(8)
    end

    it 'increases total revenue when boarding a rider' do
      @ride1.charge_visitor_fee(@visitor1)

      expect(@ride1.total_revenue).to eq(1)

      @ride1.charge_visitor_fee(@visitor1)

      expect(@ride1.total_revenue).to eq(2)
    end
  end

  describe '#rider_log' do
    it 'can return a hash of all the riders and how many times they boarded' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)

      expect(@ride1.rider_log).to eq({@visitor1 => 1, @visitor2 => 1})

      @ride1.board_rider(@visitor1)

      expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
    end

    it 'can perform all the actions when a rider boards a ride' do
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor4)

      expect(@visitor1.spending_money).to eq(10)
      expect(@visitor2.spending_money).to eq(5)
      expect(@visitor4.spending_money).to eq(13)

      expect(@ride3.total_revenue).to eq(2)
      expect(@ride3.rider_log).to eq(@visitor4 => 1)
    end
  end
end