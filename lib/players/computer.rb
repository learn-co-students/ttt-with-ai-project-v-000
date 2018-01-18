module Players

  class Computer < Player

    def move(board)
      think(board)
    end

    # Explanation of the logic behind my #think A.I. method:
    #  check if you are one move away from winning, take the winning move, end turn
    #  else check if other player is one move away from completing a winning combination, block it, end turn
    #  else since no one is one move away from winning, review status of the board:
    #    1. Check for winning combinations that don't have the other player's token in it (collect them as subset of WIN_COMBINATIONS)
    #      a. for all the combinations, map the frequency of each empty cell
    #      b. Choose the empty cell(s) with the highest frequency (because it optimizes the computer's chances of winning multiple ways)
    #      c. If multiple cells tie for highest frequency, randomly choose one of them, end turn
    #    2. If no winning combinations are available, randomly choose between the available cells on the board, end turn
    #
    # NOTE: After some testing, I realized this logic must be optimal because the computer is unbeatable.
    # P.S. That makes me feel good because I honestly didn't look up any A.I. algorithms, I just thought about it! :)
    # P.P.S. To make the game more dynamic for the human player, I imagine I could implement probability based conditions for:
    #          a. blocking a winning move
    #          b. taking a winning move
    #          c. choosing the cell with the highest frequency
    # The lower the probability of the computer choosing any of these optimally, the easier the game. Basically, I've discovered difficulty settings (duh, lol)...but I'm not gonna bother with implementing that now :)

    def think(board)
      if im_one_move_away?(board)
        final_move = im_one_move_away?(board).find { |index| board.cells[index] == " "  }
        (final_move + 1).to_s
      elsif opponent_one_move_away?(board)
        final_move = opponent_one_move_away?(board).find { |index| board.cells[index] == " " }
        (final_move + 1).to_s
      else
        combos = available_winning_combos(board)
        if combos.size > 0
          possible_moves = frequency_list(combos,board)
          best_moves = possible_moves[possible_moves.keys.max]
          best_moves[rand(0..best_moves.size-1)]
        else
          moves = available_moves(board)
          moves[rand(0..moves.size-1)]
        end
      end 
    end

    def im_one_move_away?(board)
      Game::WIN_COMBINATIONS.detect { |index| (board.cells[index[0]] == self.token && board.cells[index[1]] == self.token && board.cells[index[2]] == " ") || (board.cells[index[0]] == self.token && board.cells[index[2]] == self.token && board.cells[index[1]] == " ") || (board.cells[index[2]] == self.token && board.cells[index[1]] == self.token && board.cells[index[0]] == " ")  }
    end

    def opponent_one_move_away?(board)
      Game::WIN_COMBINATIONS.detect { |index| ((board.cells[index[0]] != " " && board.cells[index[0]] != self.token) && (board.cells[index[1]] != " " && board.cells[index[1]] != self.token) && board.cells[index[2]] == " ") || ((board.cells[index[0]] != " " && board.cells[index[0]] != self.token) && (board.cells[index[2]] != " " && board.cells[index[2]] != self.token) && board.cells[index[1]] == " ") || ((board.cells[index[2]] != " " && board.cells[index[2]] != self.token) && (board.cells[index[1]] != " " && board.cells[index[1]] != self.token) && board.cells[index[0]] == " ") }
    end

    def available_winning_combos(board)
      Game::WIN_COMBINATIONS.find_all { |combo| combo.all? { |index| board.cells[index] == " " || board.cells[index] == self.token }  }
    end

    def frequency_list(combos, board)
      {}.tap do |list|
        available_cells = combos.flatten.sort.uniq.delete_if { |cell| board.cells[cell] != " "  }
        count_list = available_cells.map {|cell| combos.flatten.count(cell)}
        tuple_list = []
        count_list.each_with_index {|count,index| tuple_list << [count,(available_cells[index]+1).to_s] }
        tuple_list.each do |tuple|
          if !list.key?(tuple[0])
            list[tuple[0]] = []
            list[tuple[0]] << tuple[1]
          else
            list[tuple[0]] << tuple[1]
          end
        end
      end
    end

    def available_moves(board)
      cell_indices = []
      for index in 0..board.cells.size-1
        if board.cells[index] == " "
          cell_indices << (index+1).to_s
        end
      end
      cell_indices
    end
  end
end