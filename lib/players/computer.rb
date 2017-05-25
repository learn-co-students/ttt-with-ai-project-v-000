class Players::Computer < Player

  def move(board)

    valid_move = ""
      number = Random.new
      input = number.rand(9)
    #  empty_board =  board.cells.all?{|c| c == " "}
      if board.valid_move?(input) && board.valid_input?(input)
        valid_move.clear
        valid_move << input.to_s
      end
      if board.turn_count == 0
        valid_move.clear
        valid_move << 5.to_s
      end
      if board.turn_count == 1 || board.turn_count == 2 && !board.cells[5].include?("X" || "O")
        valid_move.clear
        valid_move << 5.to_s
      end

      # combinations = Game::WIN_COMBINATIONS
      # def find_target
      #   if board.turn_count > 2
      #     combinations.find do |combo|
      #       combo.values_at(0, 1, 2) != [" ", " ", " "]
      #     end #find
      #   end #if
      # end #find_target
      #

        if board.turn_count > 2 && board.cells[0] != " " && board.cells[1] != " "
          valid_move.clear
          valid_move << 3.to_s
        end
        if board.turn_count > 2 && board.cells[0] != " " && board.cells[3] != " "
          valid_move.clear
          valid_move << 7.to_s
        end

  #     binding.pry

      valid_move

  end  #move

end #Players::Computer
