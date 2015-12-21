class Roll
  attr_reader :values

  def initialize(dice, values=nil)
    @values = []
    dice.times { @values << rand(1..6) }
    @values = values unless values.nil?
  end

  def calculate_score
    score = 0
    numbers = Hash.new 0
    non_scoring, non_scoring_numbers = 0, [2, 3, 4, 6]

    self.values.each do |n|
      numbers[n] += 1
      if numbers[n] == 3
        score += (n == 1) ? 1000 : 100 * n
        numbers[n] = 0
      end
    end

    score += numbers[1] * 100
    score += numbers[5] * 50

    non_scoring_numbers.each do |n|
      non_scoring += numbers[n]
    end

    [score, non_scoring]
  end
end