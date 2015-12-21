require 'spec_helper'

describe Roll do

  before :each do
    @roll = Roll.new(5)
  end

  describe "#new" do
    it "should be an instance of the Roll" do
      expect(@roll).to be_an_instance_of Roll
    end

    it "should roll a specified number of dice" do
      expect(@roll.values.size).to eql(5)
    end

    it 'should generates random numbers from 1 to 6' do
      expect(@roll.values.max).to be_between(1, 6)
      expect(@roll.values.min).to be_between(1, 6)
    end
  end

  describe "#calculate_score" do
    it "should return an array" do
      expect(@roll.calculate_score).to be_a(Array)
    end

    it "should return [score, non_scoring]" do
      expect(@roll.calculate_score.size).to eql(2)
    end

    it "should calculate score on current roll and count non-scoring dice" do
      @roll.instance_eval('@values = [5, 1, 3, 4, 1]')
      expect(@roll.calculate_score).to eql([250, 2])

      @roll.instance_eval('@values = [1, 1, 1, 3, 1]')
      expect(@roll.calculate_score).to eql([1100, 1])

      @roll.instance_eval('@values = [2, 4, 4, 5, 4]')
      expect(@roll.calculate_score).to eql([450, 1])
    end
  end

end