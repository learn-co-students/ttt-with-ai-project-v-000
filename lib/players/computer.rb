module Players
  class Computer < Player
    attr_accessor :available, :combo, :computer_move

    def move(board)
      @available = []
      check_for_tictac(board)
      if computer_move != nil
        binding.pry
        computer_move
      else
        board.cells.each.with_index do | position, index |
          if board.valid_move?( index + 1 )
            @available << ( index + 1 ).to_s
          end
        end #board.cells.each
        computer_move = @available.sample.to_s
      end #if/else
    end # #move(board)

    def check_for_tictac(board)
      Game::WIN_COMBINATIONS.each do | combo |
        check_board = []
        combo.each do | slot |
          check_board << board.cells[slot]
        end
        if (check_board.count("X") == 2 || check_board.count("O") == 2) && check_board.count(" ") == 1
          puts "tictac in combo #{combo}"
          combo.each do | board_index |
            if game.board.valid_move?(board_index+1)
              computer_move = board_index+1.to_s
            end
          end #combo.each
        else
          computer_move = nil
        end #if/else
      end #WIN_COMBINATIONS.each

    end #check_for_tictac

  end # Class Computer

end # Module Players
