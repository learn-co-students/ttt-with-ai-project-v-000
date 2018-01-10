module Players

  class Computer < Player

    def move(board)
      @board = board
      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      cells = @board.cells

      block_combos = {

        :block_rt => [[0, 1], [3, 4], [6, 7]],
        :block_lft => [[1, 2], [4, 5], [7, 8]],
        :block_blw => [[0, 3], [1, 4], [2, 5]],
        :block_abv => [[3, 6], [4, 7], [5, 8]],
        :hor_block_cntr => [[0, 2], [3, 5], [6, 8]],
        :ver_block_cntr => [[0, 6], [1, 7], [2, 8]],
        :diag_block_cntr => [[0, 8], [2, 6]]

      }

      diag_block_combos = {

        :block_up_rt => [6, 4],
        :block_up_lft => [8, 4],
        :block_low_rt => [0, 4],
        :block_low_lft => [2, 4]

      }

      # check block_combos against cells to pick ideal move
      block_combos.each do |key, value|

        value.each do |combo|

          if cells[combo[0]] == "X" && cells[combo[1]] == "X" || cells[combo[0]] == "O" && cells[combo[1]] == "O"

            # identify which block_combo
            if key == :block_rt
              @play_move = (combo[1] + 1) + 1
            elsif key == :block_lft
              @play_move = (combo[0] + 1) - 1
            elsif key == :block_blw
              @play_move = (combo[1] + 1) + 3
            elsif key == :block_abv
              @play_move = (combo[0] + 1) - 3
            elsif key == :hor_block_cntr
              @play_move = (combo[0] + 1) + 1
            elsif key == :ver_block_cntr
              @play_move = (combo[1] + 1) - 3
            elsif key == :diag_block_cntr
              @play_move = 5
            else
              choice = @valid_moves.sample # make this concrete...not random...
              @play_move = @valid_moves[choice.to_i]
              @play_move
            end

          else
            choice = @valid_moves.sample
            @play_move = @valid_moves[choice.to_i]
            @play_move
          end

        end

      end

      if @board.valid_move?(@play_move)
        @play_move.to_s
      end

    end

  end

end

# Crazy result! Why did this let me win? It should have detected BLOCK ABOVE. Offensive moves? No .sample?

  # Your turn, O.
  #  X |   |
  # -----------
  #    | X | O
  # -----------
  #  O | X | O
  # Your turn, X.
  # Please enter your move, 1-9
  # 3
  #  X |   | X
  # -----------
  #    | X | O
  # -----------
  #  O | X | O
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  # Please enter a valid move, 1-9.
  # Your turn, O.
  #  X |   | X
  # -----------
  #  O | X | O
  # -----------
  #  O | X | O
