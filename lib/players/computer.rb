class Players::Computer < Player

  def move(board)

    valid_move = ""
      number = Random.new
      input = number.rand(10)
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

      if board.turn_count >= 3 && board.cells[0] != " " && board.cells[1] != " " &&  board.cells[2] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      end
      if board.turn_count >= 3 && board.cells[0] != " " && board.cells[3] != " " &&  board.cells[6] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 7.to_s
      end
      if board.turn_count >= 3 && board.cells[8] != " " && board.cells[5] != " " &&  board.cells[2] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 3.to_s
      end
      if board.turn_count >= 3 && board.cells[8] != " " && board.cells[7] != " " &&  board.cells[6] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 7.to_s
      end
      if board.turn_count >= 3 && board.cells[8] != " " && board.cells[3] != " " &&  board.cells[5] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 6.to_s
      end
      if board.turn_count >= 3 && board.cells[8] != " " && board.cells[6] != " " &&  board.cells[7] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 8.to_s
      end
      if board.turn_count >= 3 && board.cells[6] != " " && board.cells[7] != " " &&  board.cells[8] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      end
      if board.turn_count >= 3 && board.cells[6] != " " && board.cells[5] != " " &&  board.cells[8] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      end
      if board.turn_count >= 3 && board.cells[0] != " " && board.cells[4] != " " &&  board.cells[8] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 9.to_s
      end
      if board.turn_count >= 3 && board.cells[0] != " " && board.cells[8] != " " &&  board.cells[4] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 5.to_s
      end
      if board.turn_count >= 3 && board.cells[8] != " " && board.cells[4] != " " &&  board.cells[0] == " " && board.valid_input?(input)
        valid_move.clear
        valid_move << 1.to_s
      end

  #     binding.pry

      valid_move

  end  #move

end #Players::Computer
