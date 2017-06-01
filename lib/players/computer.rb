class Players::Computer < Player

  def move(board)

    valid_move = ""
      number = Random.new
      input = number.rand(10)
      combinations = Game::WIN_COMBINATIONS

    #  empty_board =  board.cells.all?{|c| c == " "}
      if board.valid_move?(input) && board.valid_input?(input)
        valid_move.clear
        valid_move << input.to_s
      end
      if board.turn_count == 0
        valid_move.clear
        valid_move << 5.to_s
      end
      if board.turn_count < 1 && !board.cells[5].include?("X" || "O") && board.valid_move?(input) && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      end

      # first row
      if board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(1, 2, 0) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(1, 2, 0) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 2, 1) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 2.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 2, 1) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 2.to_s
      end

      #first column
      if board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 7.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 7.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(3, 6, 0) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(3, 6, 0) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 6, 3) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 4.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 6, 3) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 4.to_s
      end

      # third column
      if board.turn_count >= 3 && board.cells.values_at(8, 5, 2) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(8, 5, 2) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 2.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(2, 8, 5) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 6.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 8, 5) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 6.to_s
      end

      #diagonal top left corner
      if board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(4, 8, 0) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(4, 8, 0) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 8, 4) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 8, 4) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      end

      #diagonal top right corner
      if board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 7.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 7.to_s
      end

      #danger zone middle column

      if board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 8.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 8.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(4, 7, 1) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 2.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(4, 7, 1) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 2.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(1, 7, 4) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(1, 7, 4) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      end

      # danger zone middle row

      if board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 6.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 6.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(4, 5, 3) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 4.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(4, 5, 3) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 4.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(3, 5, 4) == ["X", "X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(3, 5, 4) == ["O", "O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      end

      #covering the loop hole
      if board.turn_count == 1 && board.cells.values_at(4, 2) == ["X", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(4, 2) == ["O", " "] && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      end

      valid_move
  end  #move
end #Players::Computer
