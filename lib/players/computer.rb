module Players
  class Computer < Player


    def move(board)
      move = false
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      else
        #strategy
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select {|i| board.position(i + 1) == @token}.size == 2 && combo.any? {|i| board.position(i + 1) == " "}
            move = combo.select {|i| !board.taken?(i + 1)}
            move = move.first.to_i + 1
            move = move.to_s

          elsif combo.select {|i| board.position(i + 1) != " " && board.position(i + 1) != @token}.size == 2 && combo.any? {|i| board.position(i + 1) == " "}
            move = combo.select {|i| !board.taken?(i + 1)}
            move = move.first.to_i + 1
            move = move.to_s
          end
        end # end of detect block

        # if no move was found find any empty space
        move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken?(i)}.to_s if move == false
      end
      move
    end # end of method move
  end # end of class Computer
end # end of module Players
