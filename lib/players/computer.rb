module Players
  class Computer < Player
    attr_accessor :current_strategy, :current_board, :win_combinations, :board, :corners, :defend_against_centre, :sneeky_combinations

    def initialize(token)
      super
      @win_combinations = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
      ]
      @sneeky_combinations = [
        [0, 7],
        [2, 7],
        [1, 6],
        [1, 8],
        [3, 2],
        [3, 8],
        [0, 5],
        [6, 5]
      ]
      @current_strategy = strategy
      @corners = [0, 2, 6, 8]
      @defend_against_centre = false
    end

    def move(board)
    	board.display
      @board = board
    	@current_board = board.cells
    	if blocked?
    		@current_strategy = @win_combinations[new_strategy]
    	end

      if @token == "O" && self.second_move? && self.not_in_centre?
        this_move = self.corner_strategy
      elsif @defend_against_centre == false && self.opponent_in_centre?
        @defend_against_centre = true
        self.remove_centre_strategies
        @current_strategy = @win_combinations[new_strategy]
        this_move = @corners[rand(4)]
      elsif self.opponent_two_moves? && self.sneeky_opponent?
        this_move = self.sneeky_defence
      elsif defend?
    		this_move = self.defend
    	else
    		this_move = self.best_move
    	end
      # puts "Player = #{self.token}"
      # puts "Strategy = #{@current_strategy}"
      # puts "#{@current_board}"
      # puts "#{@win_combinations}"

    	this_move += 1
    	this_move.to_s
    end

    def blocked?
    	@current_strategy.any? {|index| @current_board[index] == opponent}
    end

    def opponent
    	self.token == "X" ? "O" : "X"
    end

    def new_strategy
    	potential_strategy = self.opponent_counter.find {|combo| combo == 0}
    	if potential_strategy.is_a? Integer
        # puts "potential_strategy = #{potential_strategy}"
    		return potential_strategy
    	else
        # puts "best guess = #{self.opponent_counter.find {|combo| combo >= 1}}"
        # puts "working with #{@win_combinations}"
    		return self.opponent_counter.find_index {|combo| combo >= 1}
    	end
    end

    def opponent_counter
    	opponent_array = []
    	@win_combinations.each do |combo|
        # binding.pry
    		counter = 0
    		combo.each do |index|
    			if @current_board[index] != self.opponent
    				counter += 1
    			end
    		end
    		opponent_array << counter
        break if opponent_array.length == 8
    	end
    	opponent_array
    end

    def defend?
    	result = self.defensive_itterator

      if result.is_a? Array
      	@win_combinations.each do |combo|
      		if result == combo
      			return true
      			break
      		end
      	end
      else
      	false
      end
    end

    def second_move?
      x = @current_board.count("X")
      o = @current_board.count("O")
      x == 1 && o == 0
    end

    def opponent_two_moves?
      @current_board.count(self.opponent) == 2
    end

    def not_in_centre?
      @current_board[4] != "X"
    end

    def opponent_in_centre?
      @current_board[4] == self.opponent
    end

    def defend
      result = self.defensive_itterator
      if result.is_a? Array
      	result.each do |index|
          if @current_board[index] == " "
            return index
            break
          end
        end
      else
        remove_result(result)
        self.move(@board)
      end
    end

    def defensive_itterator
      @win_combinations.each do |combo|
        counter = 0
        combo.each do |index|
          if @current_board[index] == self.opponent
            counter += 1
          end
          if counter == 2 && self.has_possible_move?(combo)
            return combo
            break
          end
        end
      end
      nil
    end

    def has_possible_move?(combo)
      combo.each do |index|
        if @current_board[index] == (" ")
          return true
          break
        end
      end
      false
    end

    def remove_result(result)
      index = @win_combinations.find_index(result)
      @win_combinations.delete_at(index)
    end

    def best_move
      if self.has_possible_move?(@current_strategy)
        empty_spaces = self.find_empty_space
        empty_spaces[rand(empty_spaces.length)]
      else
        loop do

          empty_spaces = self.find_empty_space
          # puts "current_strategy 1 = #{@current_strategy}"
          if empty_spaces.length > 0
            return empty_spaces[rand(empty_spaces.length)]
            break
          end
          # puts "win combo = #{@win_combinations}"
          self.remove_result(@current_strategy)
          @current_strategy = @win_combinations[new_strategy]
          # puts "current_strategy 3 = #{@current_strategy}"
        end
      end
    end

    def find_empty_space
      empty_spaces = []
      # binding.pry
      # puts "current_strategy 2 = #{@current_strategy}"
      # puts "end"
      @current_strategy.each do |index|
        if @current_board[index] == " "
          empty_spaces << index
        end
      end
      empty_spaces
    end

    def strategy
      @win_combinations[rand(8)]
    end

    def corner_strategy
      #plays in the middle to defend against the corner strategy
      new_strategies = [1, 4, 6, 7] #strategies with a middle square
      @current_strategy = @win_combinations[new_strategies[rand(4)]]
      4
    end

    def remove_centre_strategies
      combos_to_delete = []
      @win_combinations.each_with_index do |combo, index|
        if combo == [0,1,2] || combo == [6,7,8] || combo == [0,3,6] || combo == [2,5,8]
          combos_to_delete << index
        end
      end
      combos_to_delete.reverse.each do |i|
        @win_combinations.delete_at(i)
      end
    end

    def sneeky_opponent?
      arr = self.sneeky_itterator
      arr.length == 2
    end

    def sneeky_defence
      arr = self.sneeky_itterator
      # binding.pry
      self.sneeky_defence_choice(arr)
    end

    def sneeky_itterator
      arr = []
      @sneeky_combinations.each do |combo|
        counter = 0
        combo.each do |index|
          if @current_board[index] == self.opponent
            counter += 1
          end
        end

        if counter == 2
          return combo
        end
      end
      arr
    end

    def sneeky_defence_choice(arr)
      if arr == @sneeky_combinations[0] || arr == @sneeky_combinations[5]
        @current_strategy = [2, 4, 6]
        # binding.pry
        return 6
      elsif arr == @sneeky_combinations[1] || arr == @sneeky_combinations[7]
        @current_strategy = [0, 4, 8]
        # binding.pry
        return 8
      elsif arr == @sneeky_combinations[2] || arr == @sneeky_combinations[4]
        @current_strategy = [0, 4, 8]
        # binding.pry
        return 0
      elsif arr == @sneeky_combinations[3] || arr == @sneeky_combinations[6]
        @current_strategy = [2, 4, 6]
        # binding.pry
        return 2
      end
    end

  end# class Computer
end# module Players
