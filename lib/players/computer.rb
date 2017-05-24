class Players::Computer < Player

  def move(board)

    valid_move = ""
      number = Random.new
      input = number.rand(9)
      empty_board =  board.cells.all?{|c| c == " "}
      if board.valid_move?(input) && board.valid_input?(input) && !empty_board
        valid_move.clear
        valid_move << input.to_s
      end
      if empty_board
        valid_move.clear
        valid_move << 5.to_s
      end

      valid_move

  end  #move

end #Players::Computer
