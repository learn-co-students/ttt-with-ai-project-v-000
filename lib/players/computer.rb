module Players
  class Computer < Player

    def move(board)

      # ALWAYS GO FOR THE MIDDLE
            if !board.taken?(5)
      	      return "5"
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
                move_to_take = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
                move_to_take
            end
    end

  end
end
