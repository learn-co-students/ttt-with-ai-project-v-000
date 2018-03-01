require 'pry'
module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]
    
    def initial_move(board)
      first_moves ||= WIN_COMBINATIONS.sample #pick a random win_combo to play through
      i = first_moves.sample
      if board.cells[i] == " "
        move = i + 1
        move.to_s
      else
        initial_move(board)
      end
    end
    
    def move(board)
      if board.turn_count > 3
        initial_move(board)
      else
        i = rand(10)
        i.to_s
      end
    end    
  end
end