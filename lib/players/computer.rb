module Players
  class Computer < Player
    def move(board)
      if board.valid_move?("5") == true
        computer_input = "5"
      elsif false
        computer_input = ["1", "3", "7", "9"].detect {|n| board.valid_move?(n) != false}
      else computer_input = ["2", "4", "5", "8", "6"].detect {|n| board.valid_move?(n) != false}
      end


    end
  end
end
