require 'spec_helper'

describe BeingLucky do

  before :each do
    @being_lucky = BeingLucky.new
  end

  describe "#new" do
    it "should be an instance of the BeingLucky" do
      expect(@being_lucky).to be_an_instance_of BeingLucky
    end

    it "Initially number of dice should be 5" do
      expect(@being_lucky.dice).to eql(5)
    end
  end

end