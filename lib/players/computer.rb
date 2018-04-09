module Players

  class Computer < Player

    def move(board)
      if self.token == "X"
        other_player = "O"
      else
        other_player = "X"
      end
      #defines first move if computer is Player 1
      if board.cells.all? {|cell| cell == " "}
        "5"
      #defines first move if computer is Player 2
      elsif board.cells.count(" ") == 8
        binding.pry
        if !board.taken?(board.cells[0])
          "1"
        else
          "3"
        end
      #defines computer's second move

      elsif board.cells.count(" ") < 8
        examined_row = []
        WIN_COMBINATIONS.each do |win_combination|

          win_combination.each do |board_position|
            examined_row << board.cells[board_position]
          end

          if examined_row.include?(self.token) && !examined_row.include?(other_player)
            empty_cell = examined_row.index(" ")
            "#{[win_combination[empty_cell]]}"
            break
          else
            examined_row.clear
          end
       end
     end
   end

  end
end
