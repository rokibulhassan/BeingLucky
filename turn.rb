class Turn
  attr_reader :player, :available_dice

  def initialize(dice, player)
    @last_score = 0
    @accumulated_score = 0
    @wants_to_continue = true
    @available_dice = dice
    @player = player
  end

end