class Player
  class Computer < Player
    def move(board)
      if board.turn_count == 0
        "5"
      elsif board.turn_count == 1
        if board.valid_move?("5")
          "5"
        elsif board.valid_move?("1")
          "1"
        end
      else
        WIN_COMBINATIONS.each do |combination|
          combination.each do |position|
            if board.cells[position] == self.token
              position.index - 1
            end
          end
        end
      end
    end
  end
end
