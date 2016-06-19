require 'pry'

class Player::Computer < Player

  def move(board)
    computer_move(board)
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

  def computer_move(board)
    dagger(board)+1 || random
  end

  def go_for_the_kill(board)
    WIN_COMBINATIONS.detect do |win|
      (board.cells[win[0]] == board.cells[win[1]] && board.cells[win[0]] == self.token && !board.taken?(win[2])) ||
      (board.cells[win[0]] == board.cells[win[2]] && board.cells[win[0]] == self.token && !board.taken?(win[1])) ||
      (board.cells[win[1]] == board.cells[win[2]] && board.cells[win[1]] == self.token && !board.taken?(win[0]))
    end
 end

 def dagger(board)
   blade = go_for_the_kill(board)
   binding.pry
    blade.detect{|index| !board.taken?(index+1)}
  end
#  def optimal #plays middle first if open, if not, randomly plays a corner, else move on to #random method
#    array = [1,3,5,7,9]
#     array.sample
#  end

  def random
    rand(1..9)
  end

end
