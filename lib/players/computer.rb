module Players
  class Computer < Player
    attr_accessor :available, :combo, :winning_combo, :blocking_combo

    def move(board)
      if (board.turn_count == 0)
        computer_move = play_odd
      elsif (board.turn_count == 1)
        if board.valid_move?("5")
          computer_move = play_center 
        else
          computer_move = play_corner
        end
      elsif (board.turn_count == 2)
        computer_move = play_random(board)
      else
        check_for_tictac(board)
        if !@winning_combo.empty?
          #play winning_combo
          puts "Prepare to lose sucka"
          computer_move = play_win_or_block(winning_combo,board)
        elsif !@blocking_combo.empty?
          #play blocking_combo
          puts "Can't get that cheese by me, meat!"
          computer_move = play_win_or_block(blocking_combo,board)
        else
          computer_move = play_random(board)
        end #if/elsif/else
      end
      computer_move
    end # #move(board)

    def check_for_tictac(board)
      @winning_combo = []
      @blocking_combo = []
      Game::WIN_COMBINATIONS.each do | combo |
        check_board = []
        combo.each do | slot |
          check_board << board.cells[slot]
        end
        if check_board.count(" ") == 1 # 2 of the 3 positions in the combo have been played
          if check_board.count(self.token) == 2 # 2 were played by the current player
            @winning_combo = combo
          elsif  (check_board.count("X") == 2 || check_board.count("O") == 2) # 2 were played by the opponent
            @blocking_combo = combo
          end #if/elsif
        end #if
      end #WIN_COMBINATIONS.each
    end #check_for_tictac

    def play_win_or_block(combo, board)
      computer_move = combo.detect { | board_index | board.valid_move?(board_index.to_i+1) }
      computer_move = computer_move.to_i+1
    end

    def play_center
      "5"
    end

    def play_corner
      ["1","3","7","9"].sample
    end

    def play_odd
      ["1","3","5","7","9"].sample
    end

    def play_random(board)
      @available = []
      board.cells.each.with_index do | position, index |
        if board.valid_move?( index + 1 )
          @available << ( index + 1 ).to_s
        end
      end #board.cells.each
      @available.sample.to_s
    end


  end # Class Computer

end # Module Players
