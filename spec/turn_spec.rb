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

    it "'Bob' rolled [5, 1, 3, 4, 1] for 450 points" do
      @turn.start
    end

  end

  describe "#start" do
    before { @turn.stub(:roll_again?).and_return(false) }
    it "'Bob' rolled [1, 1, 1, 3, 1] for 1100 points" do
      expect(@turn.start([1, 1, 1, 3, 1])).to eql(1100)
    end

    it "'Bob' rolled [2, 4, 4, 5, 4] for 450 points" do
      expect(@turn.start([2, 4, 4, 5, 4])).to eql(450)
    end

    it "'Bob' rolled [5, 1, 3, 4, 1] for 450 points" do
      expect(@turn.start([5, 1, 3, 4, 1])).to eql(250)
    end
  end
end