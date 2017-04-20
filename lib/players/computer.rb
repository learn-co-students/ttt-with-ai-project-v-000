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

      #If it is the first or second turn#

      if board.turn_count <= 1
        if @empty_spaces.include?(4)
          return "5"
        else
          #binding.pry
          number = [1, 3, 7, 9].sample
          return number
        end
      end

      #If it passed the first or second turn#

      player_x
      player_o

      if self.token == "X"
        number = best_x_move?
      else
        number = best_o_move?
      end

      #if valid?(number)
      #  number + 1
      #else
      #  move(board)
      #end

    end

    # DETECT - only returns the first element that is true
    # SELECT - returns an array elements that returned true
    # ANY - returns true if at least one iteration returns true, false if none of them do
    # ALL - every iteration must return true
    # REJECT - returns array with elements that are false

    def player_x
      x_combo = WIN_COMBINATIONS.select do |win_combo| #iterates through winning combinations, finds
                                                      #the taken X spaces that match with win combos, returns
                                                      # array of arrays with all winning combos that X can go for
          @x_spaces.any? {|i| win_combo.include?(i)}
      end

      @missing_x_nums = x_combo.reject {|i| @x_spaces.include?(i)} # TEST THIS
    end

    def player_o
      o_combo = WIN_COMBINATIONS.select do |win_combo|
          @o_spaces.any? {|i| win_combo.include?(i)}
      end

      @missing_o_nums = o_combo.reject {|i| @o_spaces.include?(i)} # TEST THIS
    end


    def best_x_move? # Should iterate through x_combo & o_combo, find the winning combination
                      # that is closest (has 2 tokens), and choose the missing token. Or find opponents
                      # missing token if opponent has 2. Else, pick one at random?
      if @missing_x_nums.size == 1
        number = @missing_x_nums[0]
      elsif @missing_o_nums.size == 1
        number = @missing_o_nums[0]
      else
        number = @missing_x_nums.detect do |n|
          @empty_spaces.any? {|i| n == i}
        end
        number
      end
    end

    def best_o_move?
      if @missing_o_nums.size == 1
        number = @missing_o_nums[0]
      elsif @missing_x_nums.size == 1
        number = @missing_x_nums[0]
      else
        number = @missing_o_nums.detect do |n|
          @empty_spaces.any? {|i| n == i}
        end
      end
      number
    end

    def valid?(number)
      number.to_i.between?(0,8) && @empty_spaces.include?(number)
    end


  end
end

# AI Logic Ideas
# - When the computer is "O" -
# 1. First turn, try the middle space. If middle is taken, try a corner space
# 2. Each turn, If O (you) has two in the winning combos and it is your turn, choose the 3rd in the combo
# 3. Then, check to see if X has two in the winning combos (including in the corners), and if yes, choose the 3rd in the combo
# 4. Otherwise, choose a spot next to another one of your tokens (O)
