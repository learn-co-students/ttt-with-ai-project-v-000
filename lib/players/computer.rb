module Players
  class Computer < Player

    # COMPUTER MOVE RULES:
    # 1. If there is a winning combo with my count = 2 and oppo count = 0, fill in 3rd spot for the win.
    # 2. If there is a winning combo with opponent count = 2 and my count = 0, fill in 3rd spot for the block.
    # 3. If opponent has a corner, and center is available, take center spot.
    # 4. If opponent has opposite corners, take a non-corner.
    # 5. If center is empty, and I have a corner, take an opposite corner.
    # 6. If corner spot is available, take it.
    # 7. If there is a winning combo where I have 1 spot, and both of the remaining spots are available, take an open spot.
    # 8. Else take first available spot.

    def initialize(token)
      super
      ######  REPLACE THIS!!!
      @opponent_token = (@token == 'X') ? 'O' : 'X'
    end

    def move(board)
      @board = board
      my_move = computer_move
      puts "\nMy move [1-9]: #{my_move[0]}"
#      puts "rule #{my_move[1]}"
      my_move[0]
    end

    private

    def computer_move  # returns ['board position to take', 'rule number used']

      # tally up moves made on WIN_COMBINATIONS.
      combo_counts = get_combo_counts  # combo_counts << [WIN_COMBINATIONS index, my_counter, oppo_counter]

      # 1. If there is a winning combo with my count = 2 and oppo count = 0, fill in 3rd spot for the win.
      combo_counts.sort! { |combo1, combo2|   # sort winning combos on my count descending and oppo count ascending.
        if combo2[1] == combo1[1]
          combo1[2] <=> combo2[2]
        else
          combo2[1] <=> combo1[1]
        end
      }

      if (combo_counts[0][1] == 2) && (combo_counts[0][2] == 0)
        return [empty_position(Game::WIN_COMBINATIONS[combo_counts[0][0]]), '1']
      end

      # 2. If there is a winning combo with opponent count = 2 and my count = 0, fill in 3rd spot for the block.
      combo_counts.sort! { |combo1, combo2|   # sort winning combos on oppo count descending and my count ascending.
        if combo2[2] == combo1[2]
          combo1[1] <=> combo2[1]
        else
          combo2[2] <=> combo1[2]
        end
      }

      if (combo_counts[0][2] == 2) && (combo_counts[0][1] == 0)
        return [empty_position(Game::WIN_COMBINATIONS[combo_counts[0][0]]), '2']
      end

      # 3. If opponent has a corner, and center is available, take center spot.
      if in_any_corner? && !@board.taken?("5")
        return ['5', '3']
      end

      # 4. If opponent has opposite corners, take a non-corner.
      if in_opposite_corners? && available_non_corner
        return [available_non_corner, '4']
      end

      # 5. If center is empty, and I have a corner, take an opposite corner.
      if !@board.taken?("5") && @board.position("1") == @token && !@board.taken?("9")
        return ['9', '5']
      elsif !@board.taken?("5") && @board.position("3") == @token && !@board.taken?("7")
          return ['7', '5']
      elsif !@board.taken?("5") && @board.position("7") == @token && !@board.taken?("3")
          return ['3', '5']
      elsif !@board.taken?("5") && @board.position("9") == @token && !@board.taken?("1")
          return ['1', '5']
      end

      # 6. If corner spot is available, take it.
      if !@board.taken?("1")
        return ['1', '6']
      elsif !@board.taken?("3")
        return ['3', '6']
      elsif !@board.taken?("7")
        return ['7', '6']
      elsif !@board.taken?("9")
        return ['9', '6']
      end

      # 7. If there is a winning combo where I have 1 spot, and both of the remaining spots are available, take an open spot.
      if combo_count = find_my_1_count(combo_counts)
        return [empty_position(Game::WIN_COMBINATIONS[combo_count[0]]), '7']
      end

      # 8. Else take first available spot.
      return [('1'..'9').detect { |input_location| @board.valid_move?(input_location) }, '8']
    end

    def get_combo_counts # tally up move counts on the various possible winning combos.
      Game::WIN_COMBINATIONS.map.with_index { |combo, index|
        my_counter = 0
        my_counter += 1 if @board.position(combo[0]+1) == @token
        my_counter += 1 if @board.position(combo[1]+1) == @token
        my_counter += 1 if @board.position(combo[2]+1) == @token
        oppo_counter = 0
        oppo_counter += 1 if @board.position(combo[0]+1) == @opponent_token
        oppo_counter += 1 if @board.position(combo[1]+1) == @opponent_token
        oppo_counter += 1 if @board.position(combo[2]+1) == @opponent_token
        [index, my_counter, oppo_counter]
      }
    end

    def empty_position(win_combo)
      return win_combo[0]+1 if !@board.taken?(win_combo[0]+1)
      return win_combo[1]+1 if !@board.taken?(win_combo[1]+1)
      return win_combo[2]+1 if !@board.taken?(win_combo[2]+1)
      nil  # ERROR
    end

    # find a winning combo where I have one spot filled in and there are two more open spots.
    def find_my_1_count(combo_counts)
      combo_counts.detect { |combo_count| (combo_count[1] == 1) && (combo_count[2] == 0) }
    end

    def in_any_corner?
      if (@board.position('1') == @opponent_token) || (@board.position('3') == @opponent_token) ||
         (@board.position('7') == @opponent_token) || (@board.position('9') == @opponent_token)
        true
      else
        false
      end
    end

    def in_opposite_corners?
      if ((@board.position('1') == @opponent_token) && (@board.position('9') == @opponent_token)) ||
         ((@board.position('3') == @opponent_token) && (@board.position('7') == @opponent_token))
        true
      else
        false
      end
    end

    def available_non_corner
      if !@board.taken?('2')
        '2'
      elsif !@board.taken?('4')
        '4'
      elsif !@board.taken?('5')
        '5'
      elsif !@board.taken?('6')
        '6'
      elsif !@board.taken?('8')
        '8'
      else
        nil
      end
    end
  end
end
