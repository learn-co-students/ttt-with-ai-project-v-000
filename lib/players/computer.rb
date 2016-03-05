class Player::Computer < Player

  def move(board)
    require "pry" ; binding.pry
    if !board.taken?(5)
      "5"
    elsif !board.taken?(1)
      "1"
    else
      [*("1".."9")].sample
    end
  end

end

# if computer chooses "5", his options to win are narrowed to
# 5-1=4 so [3,4,5], [1,4,7], 0,4,8], [6,4,2]
# so if computer(X) is player_1 and has chosen "5", its next move should be to first check if there
# are two of player_2's tokens in a row anywhere on the board (this is defense)
# and then to choose a position that will continue a possible WIN_COMBINATIONS
# WIN_COMBINATIONS is not accessible in this class as far as I can tell


# if board.turn_count > 4 (you can view board.turn_count in pry)

# check if any almost_combos are taken? (see array below) and by player_1.token or player_2.token
# if so and by player_2 then player_1 should choose the last element of the WIN_COMBINATIONS

# WIN_COMBINATIONS.detect do |combo|
#   combo.each do |position|
      # board.cells[position].sort  #sort combos so we are getting positions to be uniform array element indexes
      # if board.cells[position[0]] == player_2.token && board.cells[position[1]] == player_2.token
      #   then computer has to choose [position[2]]
    #   end
  # end
# end


# all of the computer's moves have to counter attack the other player so
# the computer's moves rely on where the other player goes -if the move is a threat
# as well as where the computer already has a postion

# WIN_COMBINATIONS = [
#   [0,1,2],
#   [3,4,5],
#   [6,7,8],
#   [0,3,6],
#   [1,4,7],
#   [2,5,8],
#   [0,4,8],
#   [6,4,2]
# ]

almost_combos = [
  [0,1],
  [1,2],
  [2,3],
  [3,4],
  [4,5],
  [6,7],
  [7,8],
  [0,3],
  [0,4],
  [1,3],
  [1,4],
  [1,5],
  [2,4],
  [2,5],
  [3,6],
  [3,7],
  [4,6],
  [4,7],
  [4,8],
  [5,7],
  [5,8]
]
