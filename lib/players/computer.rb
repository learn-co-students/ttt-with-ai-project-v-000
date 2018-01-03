module Players
  class Computer < Player
    attr_accessor :available, :combo, :tictac_combo, :current_player, :how_smart
    attr_accessor :diagonal_combo
    CENTER = ["5"]
    CORNER = ["1","3","7","9"]
    CENTER_OR_CORNER = CENTER + CORNER

    def move(board)
      computer_move = select_move(board)
    end

    def select_move(board)

      if self.how_smart == "d"
        computer_move = available(board).sample
      else
        if (board.turn_count == 0)
          computer_move = first_turn(board)
        elsif (board.turn_count == 1)
          computer_move = second_turn(board)
        elsif (board.turn_count == 2)
          computer_move = third_turn(board)
        elsif (board.turn_count > 2)
          computer_move = after_third_turn(board)
        end # turn_count if statements
        computer_move
      end # how_smart if/else
    end #select_move


    def first_turn(board)
      computer_move = play_position(CENTER_OR_CORNER,board) ## Start by playing a corner or the center
    end

    def second_turn(board)
      board.valid_move?("5") ? computer_move = play_position(CENTER,board) : computer_move = play_position(CORNER,board)
    end

    def third_turn(board)
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
    end

    def after_third_turn(board)
      check_for_tictac(board)
      if !@tictac_combo[self.token].empty?
        computer_move = play_toe(tictac_combo[self.token][0],board)
      elsif !@tictac_combo[opponent(board)].empty?
        computer_move = play_toe(tictac_combo[opponent(board)][0],board)
      else
        potential_moves = check_for_trap(board)
        computer_move = potential_moves.sample.to_s
      end #if/elsif/else
    end

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

    def check_for_trap(board)
      avoid_moves = []
      current_token = self.token
      potential_moves = available(board)
      potential_moves.each do | element |
        temp_board = Board.new
        board.cells.each_with_index { | cell, index | temp_board.cells[index] = cell }
        temp_board.cells[element.to_i - 1] = current_token
        check_for_tictac(temp_board)
        if !@tictac_combo[opponent(board)].empty?
          avoid_moves << element
        else
          token = update_token(current_token)
          next_potential_moves = available(temp_board)
          next_potential_moves.each do | next_element |
            temp_board.cells[next_element.to_i - 1] = token
            check_for_tictac(temp_board)
            avoid_moves << element if @tictac_combo[opponent(board)].length == 2 && @tictac_combo[current_token].empty?
            temp_board.cells[next_element.to_i - 1] = " "
          end
        end
      end # each
      potential_moves = potential_moves - avoid_moves
      potential_moves
    end

  end # Class Computer

end # Module Players
