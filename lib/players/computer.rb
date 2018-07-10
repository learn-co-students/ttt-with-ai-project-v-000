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
    [2,4,6]
    ]

    def opponent_token
      if self.token == "X"
        "O"
      else
        "X"
      end
    end

    def move(board)
      valid_moves = []
      board.cells.each_with_index do |space, index|
        valid_moves << (index + 1).to_s if board.valid_move?(index + 1)
      end
      move = valid_moves.sample
      valid_moves.detect do |space|
        if space == "1" || space == "3" || space == "7" || space == "9"
          move = space
        end
      end
      if valid_moves.include?("5")
        move = "5"
      end
      WIN_COMBINATIONS.any? do |combination|
        if board.cells[combination[0]] == opponent_token && board.cells[combination[1]] == opponent_token && board.cells[combination[2]] == " "
          move = (combination[2] + 1).to_s
        elsif board.cells[combination[0]] == opponent_token && board.cells[combination[2]] == opponent_token && board.cells[combination[1]] == " "
          move = (combination[1] + 1).to_s
        elsif board.cells[combination[1]] == opponent_token && board.cells[combination[2]] == opponent_token && board.cells[combination[0]] == " "
          move = (combination[0] + 1).to_s
        else
        nil
        end
      end
      move
    end
  end
end
