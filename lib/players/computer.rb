module Players
  class Computer < Player

    def initialize(token)
      puts "Please select your difficulty:"
      puts "1. Beginner"
      puts "2. Normal"
      puts "3. Expert"
      @difficulty = gets.chomp
    end

    def move(board)
      if @difficulty == "1"
          i = 0
          while i < 9
            if board.valid_move?(i)
              return i.to_s
            else
              i += 1
            end
          end
      elsif @difficulty == "2"
        Game::WIN_COMBINATIONS.detect do |combination|
          if combination.select{|i| board.position(i+1) == token}.size == 2 && combination.any?{|i| board.position(i+1) == " "}
            move_to_take = combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            return move_to_take
          elsif combination.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combination.any?{|i| board.position(i+1) == " "}
            move_to_take = combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            return move_to_take
          else
            possible_moves = @board.cells.collect {|cell| cell == " "}
          end
        end
      elsif @difficulty == "3"

            if !board.taken?(5)
      	      return "5"
            elsif board.turn_count == 1
              return "1"
            elsif board.turn_count == 2
              move_to_take = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
              return move_to_take.to_s
            elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
              return "2"
            else
              Game::WIN_COMBINATIONS.detect do |combination|
                if combination.select{|i| board.position(i+1) == token}.size == 2 && combination.any?{|i| board.position(i+1) == " "}
                  move_to_take = combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
                  return move_to_take.to_s
                elsif combination.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combination.any?{|i| board.position(i+1) == " "}
                  move_to_take = combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
                  return move_to_take.to_s
                end
              end
                move_to_take = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
                move_to_take.to_s
            end
        end

    end

  end
end
