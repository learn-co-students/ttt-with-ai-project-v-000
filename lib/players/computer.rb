module Players
  class Computer < Player
    def move(board)
      puts "The computer is thinking about it's next move..."

      if board.turn_count == 0
        move = open_move
      elsif board.turn_count == 1
        move = first_move_second_player(board)
      else
        move = random_move(board)
      end

      # sleep 2
      return move.to_s
    end

    private
    def opening_move
       corner_position << center_position).sample
    end

    def corner_positions
      [1, 3, 7, 9]
    end

    def edge_position
      [2, 4, 6, 8]
    end

    def center_position
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

    def first_move_second_player(board)
      first_move = 1 + board.cells.find_index {|cell| cell != " "}

      if corner_position.include?(first_move)
        move = center_position.first

      elsif center_position.include?(first_move)
        move = corner_position.sample

      elsif edge_position.include?(first_move)
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

      end
      move
    end

  end
end



