module Players
#in process under construction
  class Computer < Player

# X1 → O5 → X9 → O2 → X8 → O7 → X3 → O6 → X4, this game will be a draw.

    def move(board)
      move = nil
      # binding.pry
      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1 && !board.taken?(1)
        move = "1"

      elsif board.turn_count == 2
        move = [1,3,7,9].detect {|m| !board.taken?(m)}.to_s

      elsif board.turn_count == 3 && !board.taken?(2) && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"
      else

          if Game::WIN_COMBINATIONS.detect do |combo|

            combo.select{|index| index == token}.size == 2 &&
               combo.any? {|index| board.position(index) == " "}
              move = combo.select{|index|board.position}
           end


        # [1,2,3,4,5,6,7,8,9].sample
        end
      end
    end
  end
# end
