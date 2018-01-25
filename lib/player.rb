class Player

      WIN_COMBINATIONS = [
        [0,1,2], [3,4,5],[6,7,8],
        [0,4,8], [2,4,6],
        [0,3,6], [1,4,7], [2,5,8]
      ]
      
  attr_reader :token
  def initialize(token)
    @token = token
  end

# HOW TO HAVE THESE 2 METHODS ONLY FOR COMPUTER?

def opponent_token
  token == "X" ? "O" : "X"
end

  def opponent_has_2?(board)
    opponent_position_taken = []
    board.cells.each_with_index do |cell, i|
       opponent_position_taken << (i+1) if cell == opponent_token
     end
  #    two_out_of_three = false
  #   WIN_COMBINATIONS.each do |combo|
  #    winning_combo = combo if (combo - position_taken[0]).empty? || (combo - position_taken[1]).empty? # if combo is included in position_taken
  #   end
  #   winning_combo
  opponent_position_taken
  end


end
