require "pry"
module Players
  class Computer < Player 
    def move(board, game=Game.new)
      choice = ""
      cells = board.cells
      corners = ["1", "3", "7", "9"]
      
      if board.turn_count == 0
  #Take a corner
        choice = corners.sample
      elsif board.turn_count == 1
  #Take another corner
        return get_sample(corners, board)
      elsif board.turn_count == 2
  #Take another corner
        choice = corners.sample
        until board.valid_move?(choice)
          choice = corners.sample
        end
        choice
      else 
        get_sample((1..9).to_a, board)
      end
    end
    
    def get_sample(arr, board)
      result = arr.sample
      until board.valid_move?(result)
        result = arr.sample
      end
      result
    end
  end
end