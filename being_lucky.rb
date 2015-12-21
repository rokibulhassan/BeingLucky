class BeingLucky
  attr_reader :dice, :players, :scores, :in_the_game, :final_round

  def initialize(dice=nil)
    @dice = dice||5
    @players = ['Bob', 'Woofer']
    @scores = Hash.new 0
    @in_the_game = false
    @final_round = false
  end

  def score
    self.play_game
    winning_score = scores.sort { |a, b| b[1]<=>a[1] }.first
    puts "\nWinner :: #{winning_score[0]} scored #{winning_score[1]} points!"
  end

  def play_game
    display_players

    while players.size > 0
      player = @players.shift
      players.push(player) unless @final_round
      puts "\n\n"

      points = take_a_turn(player)
      display_result(player, points)
      accruing_points(player, points)
      play_final_round(player)
    end
  end

  def display_players
    puts "\n Players #{self.players.join(', ')} are playing Being Lucky"
  end

  def take_a_turn(player)
    Turn.new(self.dice, player).start
  end

  def display_result(player, points)
    result = "#{player} score: #{points} points"
    if scores[player] == 0
      if 0 < points && points < 300
        result += " and not counting"
      elsif points >= 300
        result += " and * Starts * counting"
      end
    end
    puts result
  end

  def accruing_points(player, points)
    if scores[player] > 0 || points >= 300
      scores[player] += points
      @in_the_game = true
    end
    puts "#{player} has #{scores[player]}"
  end

  def play_final_round(player)
    if scores[player] >= 3000
      puts "\n... Playing * Final * round ..." unless @final_round
      @final_round = true
    end
  end
end



