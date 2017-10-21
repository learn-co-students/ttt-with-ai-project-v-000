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
        move = [1,3,7,9].detect {|mv| !board.taken?(mv)}.to_s

      elsif board.turn_count == 3 && !board.taken?(8) && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "8"

      # elsif board.turn_count == 4 && !board.taken?(7) && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
      #   move = "7"


      else

          Game::WIN_COMBINATIONS.detect do |combo|
              binding.pry
            #if can win do this code
          if combo.select {|index| board.position(index+1) == token}.size == 2 && combo.any? {|index|board.position(index+1) == " "}
            move = combo.select{|index|!board.taken?(index+1)}.first.to_i.+(1).to_s

            #if can't win, do this code to block

          elsif combo.select {|index| board.position(index+1) != " " &&  board.position(index+1) != token}.size == 2 && combo.any? {|index|board.position(index+1) == " "}
            move = combo.select{|index|!board.taken?(index+1)}.first.to_i.+(1).to_s


          end
        end

      end





        # [1,2,3,4,5,6,7,8,9].sample
    end
  end
end
