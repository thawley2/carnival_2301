require 'spec_helper'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@visitor1).to be_a(Visitor)
    end

    it 'has a name' do
      expect(@visitor1.name).to eq("Bruce")
    end

    it 'has a height' do
      expect(@visitor1.height).to eq(54)
    end

    it 'has spending_money' do
      expect(@visitor1.spending_money).to eq(10)
    end

    it 'has preferences' do
      expect(@visitor1.preferences).to eq([])
    end
  end
end