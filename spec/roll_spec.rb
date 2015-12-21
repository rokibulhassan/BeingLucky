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
end