class Player

  attr_reader :token
  def initialize(token)
    @token = token
  end

  # def opponent_has_2?(board)
  #   opponent_position_taken = []
  #   @board.cells.each_with_index do |cell, i|
  #      opponent_position_taken << i if cell == opponent_token
  #    end
  # #    two_out_of_three = false
  # #   WIN_COMBINATIONS.each do |combo|
  # #    winning_combo = combo if (combo - position_taken[0]).empty? || (combo - position_taken[1]).empty? # if combo is included in position_taken
  # #   end
  # #   winning_combo
  # opponent_position_taken
  # end


end
