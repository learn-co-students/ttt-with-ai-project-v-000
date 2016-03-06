class Player::Computer < Player
  attr_accessor :token, :combos

  def initialize(token)
    @token = token
    @combos = Game::WIN_COMBINATIONS
    if @token == "X"
      @opponents_token = "O"
    else
      @opponents_token = "X"
    end
  end

# TODO: check to see if we wrap WIN_COMBINATIONS into a method can we call it without a new instance
  def move(board)
    # 1. If first or second move, take middle
    move_index = nil
    # take_middle(board) # either return 4 if its the first or second turn or return nil

    if take_middle(board)
      move_index = take_middle(board)
    elsif win(board)
      move_index = win(board)
    elsif block(board)
      move_index = block(board)
    elsif corner(board)
      move_index = corner(board)
    else
      move_index = random(board)
    end

    "#{move_index+1}" # 0-8, 1-9
    # move_index

    # if !board.taken?(5)
    #   "5"
    # elsif !board.taken?(1)
    #   "1"
    # else
    #   combos.each do |combo|
    #   #   # if board.cells[combo[0]] == token && board.cells[combo[1]] == token
    #   require "pry" ; binding.pry
    #   #   #
    #   # board.cells[combo[2]]
    #   #   # end
    #   end
    # end
  end

  def block(board)
    block_position = nil

    combos.each do |combo|
      # combo = [0,1,2], [3,4,5]
      # if I find a position worth blocking, set it to block_position
      position_1 = board.cells[combo[0]]
      position_2 = board.cells[combo[1]]
      position_3 = board.cells[combo[2]]

      if position_1 == @opponents_token && position_2 == @opponents_token && position_3 == " "
        block_position = combo[2]
      elsif position_1 == @opponents_token  && position_3 == @opponents_token && position_2 == " "
        block_position = combo[1]
      elsif position_2 == @opponents_token && position_3 == @opponents_token && position_1 == " "
        block_position = combo[0]
      end
    end

    block_position
  end
end

# if two of the elements in a win combo array are same as token
  # then always choose the third element of that array
  #token => "O"
  #board.position(2) => " "
  # if board.turn_count > 4 (you can view board.turn_count in pry)


# if computer chooses "5", his options to win are narrowed to
# 5-1=4 so [3,4,5], [1,4,7], 0,4,8], [6,4,2]
# so if computer(X) is player_1 and has chosen "5", its next move should be to first check if there
# are two of player_2's tokens in a row anywhere on the board (this is defense)
# and then to choose a position that will continue a possible WIN_COMBINATIONS
# WIN_COMBINATIONS is not accessible in this class as far as I can tell

# elsif board.taken?(1) && board.taken?(2) && !board.taken?(3)
#   "3"
# elsif @combos.each do |combo|
#   board.cells[combo].sort
  # if combo.count{|s| board.cells|s| = @token} == 2
  #   best_move = combo.select{|s| board.cells[s] == " "}
  #   return best_move.first + 1
# else
#   [*("1".."9")].sample

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
