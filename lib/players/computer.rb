module Players
  class Computer < Player
    def move(board)
       board.cells.each do |space|
       computer_move = board.cells.index(space) + 1
        if board.valid_move?(computer_move) == "5"
          return computer_move.to_s
        elsif board.valid_move?(computer_move) == "1" || board.valid_move?(computer_move) == "3" ||
          board.valid_move?(computer_move) == "7" || board.valid_move?(computer_move) == "9"
          return computer_move.to_s
        elsif board.valid_move?(computer_move) == "2" || board.valid_move?(computer_move) == "4" ||
          board.valid_move?(computer_move) == "6" || board.valid_move?(computer_move) == "8"
          computer_move.to_s
        end
        # binding.pry
      end
    end
  end
end
