module Players
  class Computer < Player
    def move(board)
      puts "The computer is thinking about it's next move..."

      if board.turn_count == 0
        # First move for first player.
        move = opening_position
        puts "The computer has chosen an opening move of #{move}."
      elsif board.turn_count == 1
      
        # First move for second player.
        first_move = 1 + board.cells.find_index {|cell| cell != " "}
        puts "The previous first move was #{first_move}."

        # if player_1 start in corner.
        if corner.include?(first_move)
          move = center.first
          puts "The second player has chosen an opening move of #{move}."
        # if player_1 start in center
        elsif center.include?(first_move)
          move = corner.sample
          puts "The second player picked a corner."
        # if player_1 start on edge
        elsif edge.include?(first_move)
          case first_move
            when 2
              move = [1, 3].sample
            when 6
              move = [3, 9].sample
            when 8
              move = [7, 9].sample
            when 4
              move = [1, 7].sample
            end
          puts "The second player picked the corner in position #{move}."
        end
        
        elsif board.turn_count == 3
        #First_player_second_move
        
        #First_player_is_in_center
        #Second_player_is_on_edge
        opponent_token = opponent_player_token
        case 2nd_player_position
            when 2
              move = [1, 3].sample
            when 6
              move = [3, 9].sample
            when 8
              move = [7, 9].sample
            when 4
              move = [1, 7].sample
            end
        
        

      else
        # if board.turn_count.even? then first player.
        # if board.turn_count.odd? then second player.
        move = random_move(board)
        puts "The computer has chosen a random move of #{move}."
      end

      sleep 2
      return move
    end

    private
    def opponent_player_token
      if @token == "X"
        "O"
      else
        @token
      end
    end
    
    def opening_position
      (corner << center).sample(1).first
    end

    def corner
      [1, 3, 7, 9]
    end

    def edge
      [2, 4, 6, 8]
    end

    def center
      [5]
    end
    
    def random_move(board)
      (1..9).each_with_object("") do |x, obj|
        if board.valid_move?(x)
          obj = x.to_s
          return obj
        end
      end
    end
  end
end

