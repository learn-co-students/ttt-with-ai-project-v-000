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

        # if middle start in corner.
        if corner.include?(first_move)
          move = center.first
          puts "The second player has chosen an opening move of #{move}."
        elsif center.include?(first_move)
          move = corner.sample(1).first
          puts "The second player picked a corner."
        else
          move = random_move(board)
          puts "The second player played a random opening move of #{move}."
        end
        # if corner start in center.
        # if edge pick corker next to opponent.

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

