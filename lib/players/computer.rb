class Player::Computer < Player

    WINNERS = [[0,1,2],
              [3,4,5],
              [6,7,8],
              [0,3,6],
              [1,4,7],
              [2,5,8],
              [0,4,8],
              [6,4,2]]

  def move(board)
    computer_move = rand(1..9)
    computer_move.to_s
  end



end


#move_combos = WINNERS.detect{|x| if board.cells[x[0]] == board.cells[x[1]] || board.cells[x[0]] == board.cells[x[2]] || board.cells[x[1]] == board.cells[x[2]]
 #   end}