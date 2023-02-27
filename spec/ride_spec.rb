require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle 
      })

      @visitor1 = Visitor.new('Bruce', 54, '$10')
      @visitor2 = Visitor.new('Tucker', 36, '$5')
      @visitor3 = Visitor.new('Thomas', 23, '$15')

      @visitor1.add_preferences(:gentle)
      @visitor2.add_preferences(:gentle)
      @visitor3.add_preferences(:extreme)
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
      @ride1.board_rider(@visitor1)

      expect(@visitor1.spending_money).to eq(9)

      @ride1.board_rider(@visitor1)

      expect(@visitor1.spending_money).to eq(8)
    end

    it 'increases total revenue when boarding a rider' do
      @ride1.board_rider(@visitor1)

      expect(@ride1.total_revenue).to eq(1)

      @ride1.board_rider(@visitor1)

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
  end
end