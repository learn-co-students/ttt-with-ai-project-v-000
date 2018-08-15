module Players
  class Computer < Player
    def move(board)
      position = winnable?(board)
      if position != nil
        # prioritize stop opponent from winning or make our move to win
        position
      elsif board.valid_move?("5")
        # next prioritize middle spot
        "5"
      elsif board.turn_count == 1
        # if middle taken on first move, then play corner next
        corners = ["1","3","7","9"]
        corners.sample
      else
        possibilities = make_two_in_a_row(board)
        if possibilities == []
          random = []
          board.cells.each_with_index do |value, index|
            if value == " "
              random << ((index + 1).to_s)
            end
          end
          random.sample
        else
          smart_moves = possibilities.sample.select do |index|
            board.cells[index] == " "
          end
          (smart_moves.sample + 1).to_s
        end
      end
    end

    def make_two_in_a_row(board)
      result = Game::WIN_COMBINATIONS.select do |combo|
        pos_1 = combo[0]
        pos_2 = combo[1]
        pos_3 = combo[2]
        array = [board.cells[pos_1], board.cells[pos_2], board.cells[pos_3]]
        empty_count = 0
        same_token = nil
        array.each do |element|
          if element == " "
            empty_count += 1
          elsif element == self.token
            same_token = true
          else
            same_token = false
          end
        end
        if same_token && empty_count == 2
          true
        else
          false
        end
      end
    end

    # returns nil if not winnable, or returns the winning position as a string
    def winnable?(board)
      result = Game::WIN_COMBINATIONS.detect do |combo|
        pos_1 = combo[0]
        pos_2 = combo[1]
        pos_3 = combo[2]
        array = [board.cells[pos_1], board.cells[pos_2], board.cells[pos_3]]
        true_or_false = count_for_winnable(array)
      end
      if result == nil
        nil
      else
        spot = nil
        result.each do |index|
          if board.cells[index] == " "
            spot = index
          end
        end
        spot = spot + 1
        spot.to_s
      end
    end

    # called on by #winnable?
    def count_for_winnable(win_array)
      x_count = 0
      o_count = 0
      open_count = 0
      win_array.each do |position|
          if position == "X"
            x_count += 1
          elsif position == "O"
            o_count += 1
          else
            open_count += 1
          end
      end
      check_for_winnable(x_count, o_count, open_count)
    end

    # called on by #count_for_winnable,
    # returns true if winnable; false if not
    def check_for_winnable(x, o, open)
      if (x == 2 && open == 1) || (o ==2 && open == 1)
        true
      else
        false
      end
    end

  end
end
