class Player::Computer < Player

  def move(board)
    go_for_the_kill
  end

  WIN_COMBINATIONS = [
    #horizontal wins
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertial wins
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal wins
    [2,4,6],
    [0,4,8]
  ]

#  def computer_move
#    if go_for_the_kill
#      go_for_the_kill #execute that move
#    else
#      rand(1..9) #otherwise play a random valid number.
#    end
#  end

  def go_for_the_kill
      WIN_COMBINATIONS.detect do |win|
        if board.cells[win[0]] == board.cells[win[1]] && board.taken?(win[0]+1) && board.cells[win[0]] == self.token && !board.taken?(win[2])
  				self.move(board) = board.cells[win[2]+1]
  			elsif board.cells[win[0]] == board.cells[win[2]] && board.taken?(win[0]+1) && board.cells[win[0]] == self.token && !board.taken?(win[1])
  				self.move(board) = board.cells[win[1]+1]
  			elsif board.cells[win[1]] == board.cells[win[2]] && board.taken?(win[1]+1) && board.cells[win[1]] == self.token && !board.taken?(win[0])
  				self.move(board) = board.cells[win[0]+1]
        else
          rand(1..9)
  			end
      end
   end

#  def optimal #plays middle first if open, if not, randomly plays a corner, else move on to #random method
#    array = [1,3,5,7,9]
#     array.sample
#  end

#  def random
#    rand(1..9)
#  end

end
