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

  describe "#accruing_points" do
    before :each do
      @being_lucky.accruing_points('Bob', 302)
      @score = @being_lucky.scores.sort { |a, b| b[1]<=>a[1] }.first
    end

    it "should start point counting, if points >= 300" do
      expect(@score[1]).to be >= 300
      expect(@being_lucky.in_the_game).to be true
    end
  end

  describe "#play_final_round" do
    before :each do
      @being_lucky.instance_eval("@scores = {'Bob' => 3002, 'Woofer' => 2700}")
      @being_lucky.play_final_round('Bob')
      @score = @being_lucky.scores.sort { |a, b| b[1]<=>a[1] }.first
    end

    it "should enter in final round if scores >= 3000" do
      expect(@score[1]).to be >= 3000
      expect(@being_lucky.final_round).to be true
    end
  end

  describe "#score" do
    it "should scored for the game" do
      @being_lucky.score
    end
  end

end