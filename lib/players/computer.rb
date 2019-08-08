class Players

  class Computer < Player

    def move(board)
      possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      possible_moves.delete_if {|number| !board.valid_move?(number)}

      if board.valid_move?("5")
        "5"
      else
        possible_moves[0]
      end
    end

  end
end
