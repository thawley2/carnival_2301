require 'spec_helper'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
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

  describe '#add_preferences' do
    it 'can add preferences' do
      @visitor1.add_preference(:gentle)

      expect(@visitor1.preferences).to eq([:gentle])

      @visitor1.add_preference(:water)

      expect(@visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#tall_enough?' do
    it 'can return true or false if a visitor is tall enough' do
      expect(@visitor1.tall_enough?(54)).to be true
      expect(@visitor2.tall_enough?(54)).to be false
      expect(@visitor3.tall_enough?(54)).to be true
      expect(@visitor1.tall_enough?(64)).to be false
    end
  end
end