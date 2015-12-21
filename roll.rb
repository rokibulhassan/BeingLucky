class Roll
  attr_reader :values

  def initialize(dice)
    @values = []
    dice.times { @values << rand(1..6) }
    @values
  end
end