module Players
  class Computer < Player
    # your code here
    def move(board)
      valid_move_array = []
      move_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      move_array.each do |option|
        if board.valid_move?(option) == true
          valid_move_array << option
        end
      end
    return valid_move_array[0]
    end
  end
end
