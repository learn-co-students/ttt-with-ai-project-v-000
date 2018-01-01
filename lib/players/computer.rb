module Players
  class Computer < Player
    attr_accessor :available, :combo, :winning_combo, :blocking_combo, :current_player
    attr_accessor :diagonal_combo

#    @current_player = self.token
    CENTER = ["5"]
    CORNER = ["1","3","7","9"]
    EDGE = ["2","4","6","8"]
    NOT_EDGE = ["1","3","5","7","9"]

    def move(board)
      computer_move = select_move(board) || computer_move = available(board).sample.to_s #Random move - fallback if select_move doesn't return a move
    end

    def select_move(board)
      if (board.turn_count == 0) #X
        computer_move = play_position(NOT_EDGE,board) ## Start by playing a corner or the center
      end

      if (board.turn_count == 1) #O # Play the center if it's available or a corner
        if board.valid_move?("5")
          computer_move = play_position(CENTER,board)
        else
          computer_move = play_position(CORNER,board)
        end # if/else
      end # if

      if (board.turn_count == 2) #X
        # binding.pry
        if CORNER.detect { | position | board.cells[position.to_i] == (opponent(board)) }
          computer_move = play_position(CORNER,board)
        elsif board.valid_move?("5")
          computer_move = play_position(CENTER,board)
        else
          check_for_tictac(board.cells)
          if !@diagonal_combo.empty?
            computer_move = play_toe(diagonal_combo,board)
          else
            computer_move = play_position(CORNER,board)
          end # if/else
        end # if/elsif/else
      end # if

      if (board.turn_count > 2)
        check_for_tictac(board.cells)
        # binding.pry
        if !@winning_combo.empty?
          #play winning_combo
          computer_move = play_toe(winning_combo[0],board)
        elsif !@blocking_combo.empty?
          #play blocking_combo
          puts "Can't get that cheese by me, meat!"
          computer_move = play_toe(blocking_combo,board)
        else
          potential_moves = avoid_trap(board)
          computer_move = potential_moves.sample.to_s
        end #if/elsif/else
      end # if
      computer_move
    end # #move(board)

    ### Helper Methods

    def check_for_tictac(cells)
      @winning_combo = []
      @blocking_combo = []
      Game::WIN_COMBINATIONS.each do | combo |
        check_board = []
        combo.each do | slot |
          check_board << cells[slot]
        end
        if check_board.count(" ") == 1 # 2 of the 3 positions in the combo have been played
          if check_board.count(self.token) == 2 # 2 were played by the current player
            @winning_combo << combo
          elsif  check_board.count("X") == 2 || check_board.count("O") == 2 # 2 were played by the opponent
            @blocking_combo = combo
          elsif (combo == [0,4,8] || combo == [2,4,6]) && check_board.count("X") == 1 && check_board.count("O") == 1
            @diagonal_combo = combo
          end #if/elsif
        end #if
      end #WIN_COMBINATIONS.each
    end #check_for_tictac

    def update_turn(board)
      @current_player == "X" ? "O" : "X"
    end

    def opponent(board)
      board.turn_count.even? ? "O" : "X"
    end

    def play_position(input,board)
      y = input.sample
      board.valid_move?(y) ? y : play_position(input,board)
    end

    def play_toe(combo, board)
      computer_move = combo.detect { | board_index | board.valid_move?(board_index.to_i+1) }
      computer_move = computer_move.to_i+1
    end

    def available(board)
      @available = []
      board.cells.each.with_index do | position, index |
        if board.valid_move?( index + 1 )
          @available << ( index + 1 ).to_s
        end
      end
      @available
    end

    # def find_trap(board)
    #   check_for_tictac(board.cells)
    #   if winning_combo.count == 2 ## NEED TO CHANGE CHECK_TICTAC TO COUNT OCCURRENCES
    #     computer_move = element
    #   end
    # end

    def avoid_trap(board) ##REMOVE MOVES THAT RESULT IN THE PLAYER BEING TRAPPED FROM LIST OF POSSIBLES
      avoid_moves = []
      potential_moves = available(board)
      current_player = self.token
      potential_moves.each do | element |
        temp_board = []
        board.cells.each { | cell | temp_board << cell }
        check_move(temp_board,element)
      end # each
      potential_moves = potential_moves - avoid_moves
      binding.pry
      potential_moves
    end

    def check_move(board,element)
      board[element.to_i - 1] = current_player
      check_for_tictac(board)
      # binding.pry
      if !@blocking_combo.empty?
        avoid_moves << element
      end #if/elsif/else
    end

  end # Class Computer

end # Module Players
