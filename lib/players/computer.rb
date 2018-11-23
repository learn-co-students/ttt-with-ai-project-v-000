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

def move(board, game=Game.new)

#  opponent_token

  if check_for_winning_move != nil
    number = check_for_winning_move
  elsif check_for_block != nil
    number = check_for_block
  elsif forky != nil
    number = forky
  elsif center
    number = center
  elsif opposite_corner
    number = opposite_corner
  elsif empty_corner
    number = empty_corner
  else side
    number = side
  end #ends if

  number += 1
  number.to_s

end

def opponent_token
  if self.token == "X"
    opponent_token = "O"
  else
    opponent_token = "X"
  end #ends if
end #ends method

  def check_for_winning_move
    winning_move = nil

    WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board.cells[win_index_1]
     position_2 = board.cells[win_index_2]
     position_3 = board.cells[win_index_3]
       if position_1 == self.token && position_2 == self.token && position_3 == " "
         winning_move = win_index_3
       elsif position_1 == self.token && position_2 == " " && position_3 == self.token
         winning_move = win_index_2
       elsif position_1 == " " && position_2 == self.token && position_3 == self.token
         winning_move = win_index_1
       end # end if
       end # end each
       winning_move
  end

  def check_for_block
    block_move = nil

    WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board.cells[win_index_1]
     position_2 = board.cells[win_index_2]
     position_3 = board.cells[win_index_3]
       if position_1 == opponent_token && position_2 == opponent_token && position_3 == " "
         block_move = win_index_3
       elsif position_1 == opponent_token && position_2 == " " && position_3 == opponent_token
         block_move = win_index_2
       elsif position_1 == " " && position_2 == opponent_token && position_3 == opponent_token
         block_move = win_index_1
       end # end if
       end # end each
       block_move
  end

  def forky
  end

  def center
    if board[5] =! nil
      board[5]
    end #ends if
  end #ends method

  def opposite_corner
    if board[1] == self.token
      return 9
    elsif board[3] == self.token
      return 7
    elsif board[7] == self.token
      return 3
    elsif board[9] == self.token
       return 1
    end #ends boardifs
  end

  def empty_corner
    return CORNERS.sample
  end

  def side
  end


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





  def other_stuff



      if board.turn_count == 2 && !board[5] == "O"
        return corners.sample
      end #ends if board.turn_count

    end

    my_answer = ("1".."9").to_a.sample
      until board.valid_move?(my_answer)
        my_answer = ("1".."9").to_a.sample
    end
    my_answer
  end



end #ends class
end #ends module
