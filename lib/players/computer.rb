module Players
  class Computer < Player
    attr_accessor :available, :combo

    def move(board)
      @available = []
      board.cells.each.with_index do | position, index |
        if board.valid_move?( index + 1 )
          @available << ( index + 1 ).to_s
        end
      end
      computer_move = @available.sample
    end

    def check_tictac(board)
  #    for each win combo, check board.cells[positions associated with that combo] to see if 2 of them are the same (X or O)
      Game::WIN_COMBINATIONS.each do | combo |
        check_board = []
        combo.each do | slot |
          check_board << board.cells[slot]
          binding.pry
        end
        if (check_board.count("X") == 2 || check_board.count("O") == 2) && check_board.count(" ") == 1
          puts "tictac in combo #{combo}"
          binding.pry
          play_toe
        end
      end
    end

    def play_toe
    end

  end # Class Computer

end # Module Players
# game = Game.new
#
