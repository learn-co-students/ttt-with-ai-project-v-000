module Players
  class Computer < Player

    def move(board)
      valid_move = ""
      number = Random.new
      input = number.rand(10)

      # empty_board = board.cells.all?{|cell| cell == " "}
      if board.valid_move?(input)
        valid_move.clear
        valid_move << input.to_s
      end

      # if Player 1, take middle cell
      if board.turn_count == 0
        valid_move.clear
        valid_move << 5.to_s
      # if Player 2, and middle cell is not taken, take it
      elsif board.turn_count == 1 && board.cells.values_at(4) == [" "]
        valid_move.clear
        valid_move << 5.to_s
      end

      # if Player 1 took the middle cell as first move, Player 2 takes a corner as first move
      if board.turn_count == 1 && board.cells.values_at(4, 2) == ["X", " "]
        valid_move.clear
        valid_move << 3.to_s
      # if Player 2 was able to take middle cell as first move, take a corner as second move
      elsif board.turn_count >= 3 && board.cells.values_at(4, 2) == ["O", " "]
        valid_move.clear
        valid_move << 3.to_s
      end

      # in terms of 1 Player game where logic is for Player 2, the AI
      # if statement - look for a win
      # else statement - look for a block

      # first row [0, 1, 2]
      if board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == ["O", "O", " "]
        valid_move.clear
        valid_move << 3.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == ["X", "X", " "]
        valid_move.clear
        valid_move << 3.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 1.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 1.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 2.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 1, 2) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 2.to_s
      end

      # middle row [3, 4, 5]
      if board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == ["O", "O", " "]
        valid_move.clear
        valid_move << 6.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == ["X", "X", " "]
        valid_move.clear
        valid_move << 6.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 4.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 4.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(3, 4, 5) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 5.to_s
      end

      # last row [6, 7, 8]
      if board.turn_count >= 3 && board.cells.values_at(6, 7, 8) == ["O", "O", " "]
        valid_move.clear
        valid_move << 9.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(6, 7, 8) == ["X", "X", " "]
        valid_move.clear
        valid_move << 9.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(6, 7, 8) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 7.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(6, 7, 8) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 7.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(6, 7, 8) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 8.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(6, 7, 8) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 8.to_s
      end

      # first column [0, 3, 6]
      if board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == ["O", "O", " "]
        valid_move.clear
        valid_move << 7.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == ["X", "X", " "]
        valid_move.clear
        valid_move << 7.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 1.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 1.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 4.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 3, 6) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 4.to_s
      end

      # middle column [1, 4, 7]
      if board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == ["O", "O", " "]
        valid_move.clear
        valid_move << 8.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == ["X", "X", " "]
        valid_move.clear
        valid_move << 8.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 2.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 2.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(1, 4, 7) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 5.to_s
      end

      # last column [2, 5, 8]
      if board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == ["O", "O", " "]
        valid_move.clear
        valid_move << 9.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == ["X", "X", " "]
        valid_move.clear
        valid_move << 9.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 3.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 3.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 6.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 5, 8) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 6.to_s
      end

      # top left - bottom right diagonal [0, 4, 8]
      if board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == ["O", "O", " "]
        valid_move.clear
        valid_move << 9.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == ["X", "X", " "]
        valid_move.clear
        valid_move << 9.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 1.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 1.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(0, 4, 8) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 5.to_s
      end

      # bottom left - top right diagonal [2, 4, 6]
      if board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == ["O", "O", " "]
        valid_move.clear
        valid_move << 7.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == ["X", "X", " "]
        valid_move.clear
        valid_move << 7.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == [" ", "O", "O"]
        valid_move.clear
        valid_move << 3.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == [" ", "X", "X"]
        valid_move.clear
        valid_move << 3.to_s
      end

      if board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == ["O", " ", "O"]
        valid_move.clear
        valid_move << 5.to_s
      elsif board.turn_count >= 3 && board.cells.values_at(2, 4, 6) == ["X", " ", "X"]
        valid_move.clear
        valid_move << 5.to_s
      end

      valid_move #return changed variable
    end #move
  end #class
end #module
