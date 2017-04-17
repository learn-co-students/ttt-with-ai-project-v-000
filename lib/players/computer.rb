module Players
  class Computer < Player
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

    def move(board)
      @empty_spaces = []
      @x_spaces = []
      @o_spaces = []
      @missing_x_nums = []
      @missing_o_nums = []
      #binding.pry
      board.cells.each_with_index do |token, index|
        if token == "X"
          @x_spaces << index
        elsif token == "O"
          @o_spaces << index
        else
          @empty_spaces << index
        end
      end

      if board.turn_count <= 1
        if @empty_spaces.include?(4)
          return "5"
        else
          number = [0, 2, 6, 8].detect do |n|
            @empty_spaces.any? {|i| n == i}
          end
          return number + 1
        end
      end

      player_x
      player_o
      if self.token == "X"
        best_x_move?
      else
        best_o_move?
      end

    end

    def player_x
      x_combo = WIN_COMBINATIONS.detect do |win_combo| #this finds the currently taken X spaces that match with win combos
        if @x_spaces.size <= 2
          @x_spaces.all? {|i| win_combo.include?(i)}
        else
          @x_spaces.any? {|i| win_combo.include?(i)}
        end
      end

      @missing_x_nums = x_combo.reject {|i| @x_spaces.include?(i)}
    end

    def player_o
      o_combo = WIN_COMBINATIONS.detect do |win_combo| #this finds the currently taken O spaces that match with win combos
        #if @o_spaces.size <= 2
        #  @o_spaces.all? {|i| win_combo.include?(i)}
        #else
          @o_spaces.any? {|i| win_combo.include?(i)}
        #end
      end

      @missing_o_nums = o_combo.reject {|i| @o_spaces.include?(i)}
    end


    def best_x_move?
      if @missing_x_nums.size == 1
        return @missing_x_nums[0] + 1
      elsif @missing_o_nums.size == 1
        return @missing_o_nums[0] + 1
      else
        number = @missing_x_nums.detect do |n|
          @empty_spaces.any? {|i| n == i}
        end
        return number + 1
      end
    end

    def best_o_move?
      if @missing_o_nums.size == 1
        return @missing_o_nums[0] + 1
      elsif @missing_x_nums.size == 1
        return @missing_x_nums[0] + 1
      else
        number = @missing_o_nums.detect do |n|
          @empty_spaces.any? {|i| n == i}
        end
        return number + 1
      end
    end


  end
end

# AI Logic Ideas
# - When the computer is "X" -
# 1. First turn, try the middle space. If middle is taken, try a corner space
# 2. Each turn, If X (you) has two in the winning combos and it is your turn, choose the 3rd in the combo
# 3. Then, check to see if O has two in the winning combos (including in the corners), and if yes, choose the 3rd in the combo
# 4. Otherwise, choose a spot next to another one of your tokens (x)

# WIN_COMBINATIONS = [
#  [0, 1, 2], --> [0, 1] or [1, 2] or [0, 2]
#  [3, 4, 5], --> [3, 4] or [4, 5] or [3, 5]
#  [6, 7, 8], --> [6, 7] or [7, 8] or [6, 8]
#  [0, 3, 6], --> [0, 3] or [3, 6] or [0, 6]
#  [1, 4, 7], --> [1, 4] or [4, 7] or [1, 7]
#  [2, 5, 8], --> [2, 5] or [5, 8] or [2, 8]
#  [0, 4, 8], --> [0, 4] or [4, 8] or [0, 8]
#  [6, 4, 2] --> [6, 4] or [4, 2] or [6, 2]
#]
