module Players

  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1 && !board.taken?(1)
        move = "1"

      elsif board.turn_count == 2
        move = [1,3,7,9].detect {|index| !board.taken?(index)}.to_s

      elsif board.turn_count == 3 && !board.taken?(8) && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "8"

      else

          Game::WIN_COMBINATIONS.detect do |combo|

            #(A) if can win do this code
          if combo.select {|index| board.position(index+1) == token}.size == 2 && combo.any? {|index|board.position(index+1) == " "}

            move = combo.select{|index|!board.taken?(index+1)}.first.to_i.+(1).to_s

            #(B) if can't win, do this code to block

          elsif combo.select {|index| board.position(index+1) != " " &&  board.position(index+1) != token}.size == 2 && combo.any? {|index|board.position(index+1) == " "}

            move = combo.select{|index|!board.taken?(index+1)}.first.to_i.+(1).to_s

          end
        end
          #(C) If no possible WIN_COMBINATIONS with 2 squares same token and an adjacent square then make move to an open space to an edge or a corner.
          move = [2,4,6,8,1,3,7,9].detect {|index| !board.taken?(index)}.to_s
        end
      end
    end
  end
