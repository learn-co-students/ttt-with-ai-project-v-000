module Players
  class Computer < Player
    def move(board)
       board.cells.each do |space|
       computer_move = board.cells.index(space) + 1
        if computer_move.to_s == "5"
          if board.valid_move?(computer_move)
            return computer_move.to_s
          end
        elsif computer_move.to_s == "1" || computer_move.to_s == "3" || computer_move.to_s == "7" ||
            computer_move.to_s == "9"
          if board.valid_move?(computer_move)
            return computer_move.to_s
          end
        elsif computer_move.to_s == "2" || computer_move.to_s == "4" || computer_move.to_s == "6" ||
            computer_move.to_s == "8"
          if board.valid_move?(computer_move)
            return computer_move.to_s
          end
        end
        # binding.pry
      end
    end
  end
end
