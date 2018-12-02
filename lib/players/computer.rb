module Players
class Computer < Player

attr_reader :board

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Middle column
  [2,5,8],  # Last column
  [0,4,8],  # diagnoal one
  [2,4,6]  # last diagnal
]

CORNERS = ["1", "3", "7", "9"]

SIDES = ["2", "4", "6", "8"]

def move(board)
  @board = board
  opponent_token

 if check_for_winning_move != nil
    my_answer = check_for_winning_move
#    binding.pry
 elsif check_for_block != nil
    my_answer = check_for_block
#    binding.pry
#  elsif forky != nil
#    my_answer = forky
  elsif center != nil
    my_answer = center
#    binding.pry
  elsif opposite_corner != nil
    my_answer = opposite_corner
#    binding.pry
  elsif empty_corner != nil
    my_answer = empty_corner
#    binding.pry
  elsif side != nil
    my_answer = side
#    binding.pry
  else
    my_answer = random_move
#    binding.pry
  end #ends if
  return my_answer
end #ends method

def opponent_token
  if self.token == "X"
    opponent_token = "O"
  else
    opponent_token = "X"
  end #ends if
end #ends method

  def check_for_winning_move
    winning_move = nil

    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board.cells[win_combination[0]]
      position_2 = board.cells[win_combination[1]]
      position_3 = board.cells[win_combination[2]]
      if position_1 == self.token && position_2 == self.token && position_3 == " "
        winning_move = win_combination[2]+ 1
      elsif position_1 == self.token && position_2 == " " && position_3 == self.token
        winning_move = win_combination[1] + 1
      elsif position_1 == " " && position_2 == self.token && position_3 == self.token
        winning_move = win_combination[0] + 1
      end # end if
    end # end each
    winning_move
  end #ends method

  def check_for_block
    block_move = nil

    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board.cells[win_combination[0]]
      position_2 = board.cells[win_combination[1]]
      position_3 = board.cells[win_combination[2]]
      if position_1 == opponent_token && position_2 == opponent_token && position_3 == " "
        block_move = win_combination[2] + 1
      elsif position_1 == opponent_token && position_2 == " " && position_3 == opponent_token
        block_move = win_combination[1] + 1
      elsif position_1 == " " && position_2 == opponent_token && position_3 == opponent_token
        block_move = win_combination[0] + 1
      end # end if
    end # end each
    block_move
  end #ends method

#  def forky
#  end

  def center
    my_answer = nil
    if board.cells[5] != nil && board.valid_move?(my_answer) == true
      my_answer = 5
    end #ends if
    my_answer
  end #ends method

  def opposite_corner
    my_answer = nil
    if board.cells[1] == self.token
      my_answer = 9
    elsif board.cells[3] == self.token
      my_answer = 7
    elsif board.cells[7] == self.token
      my_answer = 3
    elsif board.cells[9] == self.token
      my_answer = 1
    end #ends boardifs
    my_answer
  end

  def empty_corner
    my_answer = CORNERS.sample
    until board.valid_move?(my_answer)
      my_answer = CORNERS.sample
    end #ends until
    my_answer
  end


  def side
    my_answer = SIDES.sample
    until board.valid_move?(my_answer)
      my_answer = SIDES.sample
    end #ends until
    my_answer
  end


    def random_move
      my_answer = ("1".."9").to_a.sample
        until board.valid_move?(my_answer)
          my_answer = ("1".."9").to_a.sample
      end
      my_answer
    end #ends random_move

# Win: If you have two in a row, play the third to get three in a row.
#Block: If the opponent has two in a row, play the third to block them.
#Fork: Create an opportunity where you can win in two ways.
#Block Opponent's Fork:
#Option 1: Create two in a row to force the opponent into defending, as long as
# it doesn't result in them creating a fork or winning. For example, if "X" has
#a corner, "O" has the center, and "X" has the opposite corner as well, "O" must
# not play a corner in order to win. (Playing a corner in this scenario creates
#a fork for "X" to win.)

#Option 2: If there is a configuration where the opponent can fork, block that fork.
#Center: Play the center.
#Opposite Corner: If the opponent is in the corner, play the opposite corner.
#Empty Corner: Play an empty corner.
#Empty Side: Play an empty side.








end #ends class
end #ends module
