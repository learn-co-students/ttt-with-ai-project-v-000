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
      check_board = []
  #    for each win combo, check board.cells[positions associated with that combo] to see if 2 of them are the same (X or O)
      Game::WIN_COMBINATIONS.each do | combo |
        combo.each do | slot |
          check_board << game.cells[slot]
        end
        if check_board.count("X") == 2 || check_board.count("O") == 2
          play.toe
        end
      end
    end

  end # Class Computer

end # Module Players
board = ["X","X"," ","O"," "," ","O"," "," "]
