module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def move(board)
      #take mid as soon as possible
      if board.valid_move?("5")
      # puts "mid"
        return "5"
      end

      move = winning_move(board)
      if move
      # puts "winning_move"
        return move
      end

      move = stop_opponent_move(board)
      if move
      # puts "stop_opponent_move"
        return move
      end

      move = potential_win(board)
      if move
      # puts "potential_win"
        return move
      end

      # random move
      move = (((rand*8).round)+1).to_s
      while !board.valid_move?(move)
        move = (((rand*8).round)+1).to_s
      end
      # puts "random_move"
      move
    end

    #looks for a place that will win the game that turn
    #returns the winning move, otherwise nil
    def winning_move(board)
      move = nil
      token = self.token

      WIN_COMBINATIONS.each do |win_array|
        win_index_0 = win_array[0]
        win_index_1 = win_array[1]
        win_index_2 = win_array[2]

        value_at_win_index_0 = board.cells[win_index_0]
        value_at_win_index_1 = board.cells[win_index_1]
        value_at_win_index_2 = board.cells[win_index_2]

        if value_at_win_index_0 == " " && value_at_win_index_1 == token && value_at_win_index_2 == token
          move = (win_index_0+1).to_s
        elsif value_at_win_index_0 == token && value_at_win_index_1 == " " && value_at_win_index_2 == token
          move = (win_index_1+1).to_s
        elsif value_at_win_index_0 == token && value_at_win_index_1 == token && value_at_win_index_2 == " "
          move = (win_index_2+1).to_s
        end
      end

      move
    end

    #looks for a place where the opponent could win
    #returns that move, otherwise nil
    def stop_opponent_move(board)
      move = nil
      opponent_token = ""
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end

      WIN_COMBINATIONS.each do |win_array|
        win_index_0 = win_array[0]
        win_index_1 = win_array[1]
        win_index_2 = win_array[2]

        value_at_win_index_0 = board.cells[win_index_0]
        value_at_win_index_1 = board.cells[win_index_1]
        value_at_win_index_2 = board.cells[win_index_2]

        if value_at_win_index_0 == " " && value_at_win_index_1 == opponent_token && value_at_win_index_2 == opponent_token
          move = (win_index_0+1).to_s
        elsif value_at_win_index_0 == opponent_token && value_at_win_index_1 == " " && value_at_win_index_2 == opponent_token
          move = (win_index_1+1).to_s
        elsif value_at_win_index_0 == opponent_token && value_at_win_index_1 == opponent_token && value_at_win_index_2 == " "
          move = (win_index_2+1).to_s
        end
      end

      move
    end

    #move in a spot where it's possible to win next turn
    #look for 2 open and my spot in any combination
    #prioritize number of win potentials, then diagonal
    #first gather each move and see which one has the most potential
    # X | O |
    #------------   #while lots of positions could work well for x to win in the future, spot 4 should be best since it has two in combinations in it
    #   | X |
    #------------
    #   |   | O

    # returns "1" instead of nil in some cases
    def potential_win(board)
      move_hash = {"1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9"=> 0}
      token = self.token

      WIN_COMBINATIONS.each do |win_array|
        win_index_0 = win_array[0]
        win_index_1 = win_array[1]
        win_index_2 = win_array[2]

        value_at_win_index_0 = board.cells[win_index_0]
        value_at_win_index_1 = board.cells[win_index_1]
        value_at_win_index_2 = board.cells[win_index_2]

        if value_at_win_index_0 == token && value_at_win_index_1 == " " && value_at_win_index_2 == " "
          move_hash[(win_index_1+1).to_s] += 1
          move_hash[(win_index_2+1).to_s] += 1
        elsif value_at_win_index_0 == " " && value_at_win_index_1 == token && value_at_win_index_2 == " "
          move_hash[(win_index_0+1).to_s] += 1
          move_hash[(win_index_2+1).to_s] += 1
        elsif value_at_win_index_0 == " " && value_at_win_index_1 == " " && value_at_win_index_2 == token
          move_hash[(win_index_0+1).to_s] += 1
          move_hash[(win_index_1+1).to_s] += 1
        elsif value_at_win_index_0 == " " && value_at_win_index_1 == " " && value_at_win_index_2 == " "
          move_hash[(win_index_0+1).to_s] += 1
          move_hash[(win_index_1+1).to_s] += 1
          move_hash[(win_index_2+1).to_s] += 1
        end
      end

      # puts "#{move_hash}"
      #find the biggest value in move_hash
      move_array = []
      highest_value = 0
      move_hash.each do |key, value|
        # if
        if value > highest_value
          move_array = []
          move_array << key
          highest_value = value
        elsif value == highest_value
          if value > 0
            move_array << key
          end
        end
      end

      # puts "#{move_array}"
      #make some sense of move_array
      corner_array = []
      if move_array.size == 0
        return nil
      elsif move_array.size == 1
        return move_array[0]
      else
        #prioritize corners 1, 3, 7, 9
        if move_array.include?("1")
          corner_array << "1"
        end
        if move_array.include?("3")
          corner_array << "3"
        end
        if move_array.include?("7")
          corner_array << "7"
        end
        if move_array.include?("9")
          corner_array << "9"
        end

        if corner_array.size > 0
          return corner_array[0]
        else
          return move_array[0]
        end
      end
    end

  end
end

#------RANDOM AI------
# def move(board)
#   random_move = (((rand*8).round)+1).to_s
#   while !board.valid_move?(random_move)
#     random_move = (((rand*8).round)+1).to_s
#   end
#   random_move
# end
