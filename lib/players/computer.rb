require 'pry'
module Players
  class Computer < Player
    
    def initial_move(board)
      first_moves ||= Game::WIN_COMBINATIONS.sample #pick a random win_combo to play through
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
        rand(10).to_s
      end
    end    
  end
end