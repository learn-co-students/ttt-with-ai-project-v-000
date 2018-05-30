require 'pry'
module Players
  class Computer < Player

    WINNING_POSITIONS = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [7, 5, 3]
    ]

    def move(board)
      puts "Computer #{token}'s move:"
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      if board.turn_count == 0 || board.turn_count == 1
        move = "5"
        return move if board.valid_move?(move)
      end

      possible_wins = []
      possible_blocks = []
      future_wins = Hash.new(0)

      WINNING_POSITIONS.each do |positions|
        my_token = 0
        other_guys_token = 0

        positions.each do |position|
          if board.position(position) == @token
            my_token += 1
          elsif board.position(position) != " "
            other_guys_token += 1
          end
        end

        if my_token == 2 || other_guys_token == 2
          move = positions.find {|position| board.position(position) == " "}
          if board.valid_move?(move)
            if my_token == 2
              possible_wins << move
            elsif other_guys_token == 2
              possible_blocks << move
            end
          end
        end

        if other_guys_token == 0
          empty = positions.find_all {|position| board.position(position) == " "}
          empty.each do |x|
            future_wins[x] += 1
          end
        end
      end

      puts future_wins

      if !possible_wins.empty?
        puts "Take the win!"
        return possible_wins.sample
      elsif !possible_blocks.empty?
        puts "Block the other guy!"
        return possible_blocks.sample
      end

      highest_value = 0
      possible_move = ""
      future_wins.each do |position, value|
        if value > highest_value
          highest_value = value
          possible_move = position
        end
      end

      if possible_move != ""
        puts "Best move!"
        return possible_move
      end

      puts "No more good moves left..."
      WINNING_POSITIONS.shuffle.each do |combo|
        combo.shuffle.each do |move|
          return move if board.valid_move?(move)
        end
      end
    end
  end
end
