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

      #puts "ENTER A MOVE, PLAYER #{token}:"
      #VALID_MOVES.sample
#=begin
      if what_is_winning_move?(board)
        return what_is_winning_move?(board)
      elsif what_is_move_needed_to_block?(board)
        return what_is_move_needed_to_block?(board)
      elsif what_move_to_get_two_in_a_row?(board)
        #puts "ok looks like we can get two so let's do it...."
        a = what_move_to_get_two_in_a_row?(board)
        #puts "a is #{a}, now returning it..."
        return a
        #return what_move_to_get_two_in_a_row?(board)
      elsif lets_try_the_center(board)
        return lets_try_the_center(board)
      elsif lets_try_a_corner(board)
        return lets_try_a_corner(board)
      else
        #puts "i'm in the else"
        return VALID_MOVES.sample
      end
      #puts "i am after the whole fucking if statement"
#=end
    end

    def get_tokens(board)
      current_turn = board.turn_count + 1

      if current_turn.odd?
        return ["X", "O"]
      else
        return ["O", "X"]
      end
    end






    def what_is_winning_move?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}
        actual_positions.each do |actual_position|
          #puts "--- actual_position: #{actual_position}"
          #puts "--- board.cells[actual_position]: #{board.cells[actual_position]}"
          #puts "--- count_hash[board.cells[actual_position]]: #{count_hash[board.cells[actual_position]]}"
          #puts "--- count_hash[board.cells[actual_position]].class: #{count_hash[board.cells[actual_position]].class}"
          count_hash[board.cells[actual_position]] += 1
        end
        if count_hash[token] == 2
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              #puts "FOUND THE WINNING MOVE, IT IS USER POSITION #{actual_position + 1}"
              return actual_position + 1
            end
          end
        end
      end #win_combinations each
      false
    end #what is winning move?

    def what_is_move_needed_to_block?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}
        actual_positions.each do |actual_position|
          #puts "BLOCK--- actual_position: #{actual_position}"
          #puts "BLOCK--- board.cells[actual_position]: #{board.cells[actual_position]}"
          #puts "BLOCK--- count_hash[board.cells[actual_position]]: #{count_hash[board.cells[actual_position]]}"
          #puts "BLOCK--- count_hash[board.cells[actual_position]].class: #{count_hash[board.cells[actual_position]].class}"
          count_hash[board.cells[actual_position]] += 1
        end
        if count_hash[opponent_token] == 2
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              #puts "FOUND THE BLOCKING MOVE, IT IS USER POSITION #{actual_position + 1}"
              return actual_position + 1
            end
          end
        end
      end #win_combinations each
      false
    end

    def what_move_to_get_two_in_a_row?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}
        actual_positions.each do |actual_position|
          #puts "GETTWO--- actual_position: #{actual_position}"
          #puts "GETTWO--- board.cells[actual_position]: #{board.cells[actual_position]}"
          #puts "GETTWO--- count_hash[board.cells[actual_position]]: #{count_hash[board.cells[actual_position]]}"
          #puts "GETTWO--- count_hash[board.cells[actual_position]].class: #{count_hash[board.cells[actual_position]].class}"
          count_hash[board.cells[actual_position]] += 1
        end
        if count_hash[token] == 1 && count_hash[" "] == 2
          #puts "--------------------------- I CAN GET TWO -----------------------------"
          array = []
          type_array = []
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              array << actual_position
              type_array << POSITION_TYPES[actual_position]
            end
            #puts "array is #{array}"
            #puts "type_array is #{type_array}"
              #puts "FOUND THE WINNING MOVE, IT IS USER POSITION #{actual_position + 1}"
              #return actual_position + 1
          end
          if type_array.include?("center")
            #puts "going to return center"
            return 5
          elsif type_array.include?("corner")
            #puts "going to start loop to return the element of #{array} which is a corner"
            array.each do |actual_position|
              if POSITION_TYPES[actual_position] == "corner"
                #puts "going to return #{actual_position}, which is a corner"
                return actual_position + 1
              end
            end
          else
            sampy = array.sample
            #puts "going to return #{sampy}"
            return sampy + 1
          end
        end #if
      end #win_combinations each
      false
    end #method

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


  end #class
end #module



=begin


    def what_move_to_get_two_in_a_row?(board)
      WIN_COMBINATIONS.each do |actual_positions|
        count_hash = {"X" => 0, "O" => 0, " " => 0}
        actual_positions.each do |actual_position|
          #puts "GETTWO--- actual_position: #{actual_position}"
          #puts "GETTWO--- board.cells[actual_position]: #{board.cells[actual_position]}"
          #puts "GETTWO--- count_hash[board.cells[actual_position]]: #{count_hash[board.cells[actual_position]]}"
          puts "GETTWO--- count_hash[board.cells[actual_position]].class: #{count_hash[board.cells[actual_position]].class}"
          count_hash[board.cells[actual_position]] += 1
        end
        if count_hash[token] == 1 && count_hash[" "] == 2
          puts "--------------------------- I CAN GET TWO -----------------------------"
          array = []
          type_array = []
          actual_positions.each do |actual_position|
            if board.cells[actual_position] == " "
              array << actual_position
              type_array << POSITION_TYPES[actual_position]
            end
            puts "array is #{array}"
            puts "type_array is #{type_array}"
              #puts "FOUND THE WINNING MOVE, IT IS USER POSITION #{actual_position + 1}"
              #return actual_position + 1
          end
          if type_array.include?("center")
            puts "going to return center"
            return 5
          elsif type_array.include?("corner")
            puts "going to start loop to return the element of #{array} which is a corner"
            array.each do |actual_position|
              if POSITION_TYPES[actual_position] == "corner"
                puts "going to return #{actual_position}, which is a corner"
                return actual_position + 1
              end
            end
          else
            sampy = array.sample
            puts "going to return #{sampy}"
            return sampy + 1
          end
        end #if
      end #win_combinations each
      false
    end #method


=end
