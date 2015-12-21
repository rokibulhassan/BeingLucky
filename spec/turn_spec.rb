require 'spec_helper'

describe Turn do

  before :each do
    @turn = Turn.new(5, 'Bob')
  end

  describe "#new" do
    it "should be an instance of the Turn" do
      expect(@turn).to be_an_instance_of Turn
    end

    it "Initially number of dice should be 5" do
      expect(@turn.available_dice).to eql(5)
    end

    it "Initially name of player should be Bob" do
      expect(@turn.player).to eql('Bob')
    end
  end

end