module Players
  class Computer < Player
    attr_accessor :available, :combo, :winning_combo, :blocking_combo, :diagonal_combo

    CENTER = ["5"]
    CORNER = ["1","3","7","9"]
    EDGE = ["2","4","6","8"]
    NOT_EDGE = ["1","3","5","7","9"]

    def move(board)
      if (board.turn_count == 0) #X
        computer_move = play_position(NOT_EDGE,board)
      end
      if (board.turn_count == 1) #O
        if board.valid_move?("5")
          computer_move = play_position(CENTER,board)
        else
          computer_move = play_position(CORNER,board)
        end
      end
      if (board.turn_count == 2) #X
        if CORNER.include?(opponent(board))
          computer_move = play_position(CORNER,BOARD)
        elsif board.valid_move?("5")
          computer_move = play_position(CENTER,board)
        else
          check_for_tictac(board)                     # this should be the corner that forms a diagonal
          if !diagonal_combo.empty?
            play_win_or_block(diagonal_combo,board)
          else
            computer_move = play_position(CORNER,board)
          end
        end
      end
      if (board.turn_count > 2)
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
          computer_move = available(board).sample.to_s #Random move - fallback if all else fails
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
          elsif  check_board.count("X") == 2 || check_board.count("O") == 2 # 2 were played by the opponent
            @blocking_combo = combo
          elsif check_board.count("X") == 1 && check_board.count("O") == 1
            @diagonal_combo = combo
          end #if/elsif
        end #if
      end #WIN_COMBINATIONS.each
    end #check_for_tictac

    # def check_for_tictac(board)
    #   @winning_combo = []
    #   @blocking_combo = []
    #   Game::WIN_COMBINATIONS.each do | combo |
    #     check_board = []
    #     combo.each do | slot |
    #       check_board << board.cells[slot]
    #     end
    #     if check_board.count(" ") == 1 # 2 of the 3 positions in the combo have been played
    #       if check_board.count(self.token) == 2 # 2 were played by the current player
    #         @winning_combo = combo
    #       elsif  check_board.count("X") == 2 || check_board.count("O") == 2 # 2 were played by the opponent
    #         @blocking_combo = combo
    #       elsif check_board.count("X") == 1 && check_board.count("O") == 1
    #         @diagonal_combo = combo
    #       end #if/elsif
    #     end #if
    #   end #WIN_COMBINATIONS.each
    # end #check_for_tictac

    def opponent(board)
      board.turn_count.even? ? "O" : "X"
    end

##Will this still fit in?
    def play_position(input,board)
      y = input.sample
      board.valid_move?(y) ? y : play_position(input,board)
    end

    def play_win_or_block(combo, board)
      computer_move = combo.detect { | board_index | board.valid_move?(board_index.to_i+1) }
      computer_move = computer_move.to_i+1
    end

    def available(board)
      board.cells.each>with_index do | position, index |
        if board.valid_move?( index + 1 )
          @available << ( index + 1 ).to_s
        end
      end
    end

    def set_trap(board)
      available(board).each do | element |
        temp_board = board
        temp_board.cells[element.to_i - 1] = self.token
        check_for_tictac(temp_board)
        if winnable_combo.count == 2 ## NEED TO CHANGE CHECK_TICTAC TO COUNT OCCURRENCES
          computer_move = element
        end
      end
    end


  end # Class Computer

end # Module Players
