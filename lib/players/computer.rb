module Players
  class Computer < Player
    attr_accessor :available, :combo, :tictac_combo, :current_player
    attr_accessor :diagonal_combo
    CENTER = ["5"]
    CORNER = ["1","3","7","9"]
    EDGE = ["2","4","6","8"]
    NOT_EDGE = ["1","3","5","7","9"]

    def move(board)
      computer_move = select_move(board) ##|| computer_move = available(board).sample.to_s #Random move - fallback if select_move doesn't return a move
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
          check_for_tictac(board)
          if !@diagonal_combo.empty?
            computer_move = play_toe(diagonal_combo,board)
          else
            computer_move = play_position(CORNER,board)
          end # if/else
        end # if/elsif/else
      end # if

      if (board.turn_count > 2)
        check_for_tictac(board)
        # binding.pry
        if !@tictac_combo[self.token].empty?
          #play winning_combo
          computer_move = play_toe(tictac_combo[self.token][0],board)
        elsif !@tictac_combo[opponent(board)].empty?
          #play blocking_combo
          puts "Can't get that cheese by me, meat!"
          computer_move = play_toe(tictac_combo[opponent(board)][0],board)
        else
          potential_moves = simulate_game(board)
          computer_move = potential_moves.sample.to_s
        end #if/elsif/else
      end # if
      computer_move
    end # #move(board)

    ### Helper Methods

    def check_for_tictac(board)
      @tictac_combo = {"X" => [], "O" => []}
      Game::WIN_COMBINATIONS.each do | combo |
        check_board = []
        combo.each do | slot |
          check_board << board.cells[slot]
        end
        if check_board.count(" ") == 1 # 2 of the 3 positions in the combo have been played
          if check_board.count("X") == 2
            @tictac_combo["X"] << combo
          elsif check_board.count("O") == 2
            @tictac_combo["O"] << combo
          elsif (combo == [0,4,8] || combo == [2,4,6]) && check_board.count("X") == 1 && check_board.count("O") == 1
            @diagonal_combo = combo
          end #if/elsif
        end #if
      end #WIN_COMBINATIONS.each
    end #check_for_tictac

    def update_token(token)
      token == "X" ? "O" : "X"
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

    # def set_trap(board)
    #   check_for_tictac(board)
    #   if winning_combo.count == 2 ## NEED TO CHANGE CHECK_TICTAC TO COUNT OCCURRENCES
    #     computer_move = element
    #   end
    # end

    def simulate_game(board)
      avoid_moves = []
      current_token = self.token
      potential_moves = available(board)
      potential_moves.each do | element |
        temp_board = Board.new
        board.cells.each_with_index { | cell, index | temp_board.cells[index] = cell }
        binding.pry
        temp_board.cells[element.to_i - 1] = current_token
        check_for_tictac(temp_board)
        if !@tictac_combo[opponent(board)].empty?
          avoid_moves << element
        else
          recursion(board,temp_board,element,avoid_moves,current_token)
        end
      end # each
      potential_moves = potential_moves - avoid_moves
      potential_moves
    end

    def recursion(board,temp_board,element,avoid_moves,token)
      potential_moves = available(temp_board)
      potential_moves.each do | sub_element |
        check_for_tictac(temp_board)
        binding.pry
        if !@tictac_combo[opponent(board)].empty?
          avoid_moves << element
        # elsif
        #   ##Add code here to check for set traps
        else
          token = update_token(token)
          temp_board.cells[sub_element.to_i - 1] = token
          binding.pry
          recursion(board,temp_board,element,avoid_moves,token)
        end # if/else
      end # each
    end # recursion

  end # Class Computer

end # Module Players
