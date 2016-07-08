module Players

  class Computer < Player
    attr_reader :opponent_token

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

    VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    POSITION_TYPES = {
      0 => "corner",
      1 => "side",
      2 => "corner",
      3 => "side",
      4 => "center",
      5 => "side",
      6 => "corner",
      7 => "side",
      8 => "corner"
    }

    def move(board)
      if self.token == "X"
        @opponent_token = "O"
      else
        @opponent_token = "X"
      end

      if what_is_winning_move?(board)
        return what_is_winning_move?(board)
      elsif what_is_move_needed_to_block?(board)
        return what_is_move_needed_to_block?(board)
      elsif what_move_to_get_two_in_a_row?(board)
        return what_move_to_get_two_in_a_row?(board)
      elsif lets_try_the_center(board)
        return lets_try_the_center(board)
      elsif lets_try_a_corner(board)
        return lets_try_a_corner(board)
      else
        return VALID_MOVES.sample
      end
    end

    def what_is_winning_move?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}

        actual_positions.each do |actual_position|
          count_hash[board.cells[actual_position]] += 1
        end

        if count_hash[token] == 2
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              return actual_position + 1
            end
          end
        end
      end
      false
    end

    def what_is_move_needed_to_block?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}

        actual_positions.each do |actual_position|
          count_hash[board.cells[actual_position]] += 1
        end

        if count_hash[opponent_token] == 2
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              return actual_position + 1
            end
          end
        end
      end
      false
    end

    def what_move_to_get_two_in_a_row?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}

        actual_positions.each do |actual_position|
          count_hash[board.cells[actual_position]] += 1
        end

        if count_hash[token] == 1 && count_hash[" "] == 2
          array_of_two_open_positions = []
          type_array = []
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              array_of_two_open_positions << actual_position
              type_array << POSITION_TYPES[actual_position]
            end
          end
          if type_array.include?("center")
            return 5
          elsif type_array.include?("corner")
            array_of_two_open_positions.each do |actual_position|
              if POSITION_TYPES[actual_position] == "corner"
                return actual_position + 1
              end
            end
          else
            random_choice = array_of_two_open_positions.sample
            return random_choice + 1
          end
        end
      end
      false
    end

    def lets_try_the_center(board)
      if board.cells[4] == " "
        return 5
      else
        return false
      end
    end

    def lets_try_a_corner(board)
      corners_array = [0, 2, 6, 8]

      corners_array.each do |actual_position|
        if board.cells[actual_position] == " "
          return actual_position + 1
        else
          return false
        end
      end
    end
    
  end
end
