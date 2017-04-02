module Players
  class Computer < Player

    def move(board)
      @board = board
      if board.turn_count == 0 # move to center or corner position for first move of the game
        input = [center_move, corner_move].sample
      else
        if win_move
          input = win_move
        elsif block_move
          input = block_move
        elsif center_move
          input = center_move
        elsif opposite_corner_move
          input = opposite_corner_move
        elsif defend_trap
          input = defend_trap
        elsif corner_move
          input = corner_move
        else
          input = random_move
        end
      end
      puts ""
      sleep(0.25)
      (input + 1).to_s  # + 1 required to account for computer user's perspective (1-9) which is changed back to an index of board.cells in #<Board> methods
    end

    private # methods below return an index of board.cells (0-8)

    attr_reader :board

    def other_token
      token == "X" ? "O" : "X"
    end

    def win_move # move to win the game
      win_set = Game::WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " ") || (board.cells[combo[0]] == token && board.cells[combo[1]] == " " && board.cells[combo[2]] == token) || (board.cells[combo[0]] == " " && board.cells[combo[1]] == token && board.cells[combo[2]] == token)
      end
      win_set.detect{|element| board.cells[element] == " "} unless win_set == nil
    end

    def block_move # move to block opponent's potential winning move
      block_set = Game::WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == other_token && board.cells[combo[1]] == other_token && board.cells[combo[2]] == " ") || (board.cells[combo[0]] == other_token && board.cells[combo[1]] == " " && board.cells[combo[2]] == other_token) || (board.cells[combo[0]] == " " && board.cells[combo[1]] == other_token && board.cells[combo[2]] == other_token)
      end
      block_set.detect{|element| board.cells[element] == " "} unless block_set == nil
    end

    def center_move # move to center position
      4 if board.cells[4] == " "
    end

    def opposite_corner_move # move to corner position opposite of taken corner position
      if board.cells[0] != " " && board.cells[8] == " "
        8
      elsif board.cells[0] == " " && board.cells[8] != " "
        0
      elsif board.cells[2] != " " && board.cells[6] == " "
        6
      elsif board.cells[2] == " " && board.cells[6] != " "
        2
      end
    end

    def defend_trap # move to edge position to avoid trap when opponent occupies opposing corner positions
      if (board.cells[0] == other_token && board.cells[8] == other_token) || (board.cells[2] == other_token && board.cells[6] == other_token)
        [1, 3, 5, 7].shuffle.detect{|element| board.cells[element] == " "}
      end
    end

    def corner_move # move to corner position
      [0, 2, 6, 8].shuffle.detect{|element| board.cells[element] == " "}
    end

    def random_move # move to first remaining empty position
      board.cells.index(" ")
    end

  end
end
