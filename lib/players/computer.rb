module Players
  class Computer < Player
    attr_accessor :current_strategy, :current_board, :win_combinations, :board, :corners

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
      @current_strategy = strategy
      @corners = [0, 2, 6, 8]

    end

    def move(board)
    	board.display
      @board = board
    	@current_board = board.cells
    	if blocked?
    		@current_strategy = @win_combinations[new_strategy]
    	end

      if @token == "O" && second_move? && in_corner?
        this_move = corner_strategy
      elsif defend?
    		this_move = defend
    	else
    		this_move = best_move
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
    	potential_strategy = opponent_counter.find {|combo| combo == 0}
    	if potential_strategy.is_a? Integer
    		return potential_strategy
    	else
    		return opponent_counter.find {|combo| combo >= 1}
    	end
    end

    def opponent_counter
    	opponent_array = []
    	@win_combinations.each do |combo|
    		counter = 0
    		combo.each do |index|
    			if @current_board[index] != opponent
    				counter += 1
    			end
    		end
    		opponent_array << counter
        break if opponent_array.length == 8
    	end
    	opponent_array
    end

    def defend?
    	result = defensive_itterator

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

    def in_corner?
      @corners.each do |index|
        if @current_board[index] == "X"
          return true
        end
      end
      false
    end

    def defend
      result = defensive_itterator
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
          if @current_board[index] == opponent
            counter += 1
          end
          if counter == 2 && has_possible_move?(combo)
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
          @current_strategy = @win_combinations[new_strategy]
          empty_spaces = find_empty_space
          if empty_spaces.length > 0
            return empty_spaces[rand(empty_spaces.length)]
            break
          end
          remove_result(@current_strategy)
        end
      end
    end

    def find_empty_space
      empty_spaces = []
      # binding.pry
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

  end# class Computer
end# module Players
