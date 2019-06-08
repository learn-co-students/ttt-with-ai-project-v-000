module Players

  class Computer < Player
    WIN_COMBINATIONS = [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [7,5,3]
    def move(board)
      if !board.cells.include?(token)
        input = first_move
      elsif !return_smallest_array(board).nil?
        input = return_smallest_array(board).first
      elsif !return_random_winning_array(board).nil?
        input = return_random_winning_array(board).sample
      else
        input = rand(1..9)
      end
      sleep 1
      input.to_s
    end

    def first_move
      [1,3,6,8,9].sample
    end

    ## Finding winning arrays which includes player token
    def find_same_token_arrays(board)
      WIN_COMBINATIONS.select do |win_combo|
        win_combo.any? { |index| board.cells[index - 1] == token }
      end
    end

    ## Removes the winning token from the winning combo array and returns remaining spots
    def find_open_spots(board)
      find_same_token_arrays(board).map do |win_combo|
        win_combo.reject { |index| board.cells[index - 1] == token }
      end
    end

    ## Returns array without any opposite token (RENAME)
    def find_winning_slots(board)
      find_open_spots(board).select do |win_combo|
        win_combo.all? { |index| board.valid_move?(index) }
      end
    end

    # Returns empty slot inside winning combo array with tokens
    def return_smallest_array(board)
      find_winning_slots(board).find do |win_combo|
        win_combo if win_combo.length < 2
      end
    end

    # Returns random slot inside winning combo array with tokens
    def return_random_winning_array(board)
      find_winning_slots(board).sample
    end

  end

end
