class Turn
  attr_reader :player, :available_dice

  def initialize(dice, player)
    @last_score = 0
    @accumulated_score = 0
    @wants_to_continue = true
    @available_dice = dice
    @player = player
  end

  def start(values=nil)
    begin
      @roll = Roll.new(@available_dice, values)
      @last_score, @available_dice = @roll.calculate_score
      @accumulated_score += @last_score
      puts "#{@player} rolls: #{@roll.values.join(', ')} -> #{@last_score} points"
      @wants_to_continue = roll_again?(@available_dice) if can_continue?(@last_score, @available_dice)
    end while can_continue?(@last_score, @available_dice) && @wants_to_continue

    @last_score > 0 ? @accumulated_score : 0
  end

  private

  def can_continue?(last_score, available_dice)
    last_score > 0 && available_dice > 0
  end

  def roll_again?(available_dice)
    begin
      print "#{available_dice} dice - roll again? [Y/n] "
      input = $stdin.gets.chomp
      print "\033[A\033[2K"
    end until input.match(/^(|y(es)?|no?)$/i)
    input.match(/n/i) == nil
  end
end