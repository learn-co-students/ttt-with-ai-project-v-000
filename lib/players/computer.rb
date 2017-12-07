require 'pry'

module Players

  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
         move = [1, 3, 7, 9].detect {|x| !board.taken?(x)}.to_s

      elsif board.turn_count == 3 && (board.position(1) == board.position(9)) || (board.position(3) == board.position(7))
         move = "2"

      else
         Game::WIN_COMBINATIONS.detect do |x|

           if x.select{|i| board.position(i+1) == token}.size == 2 && x.any?{|i| board.position(i+1) == " "}
             move = x.select{|i| board.position(i+1) == " "}.to_i.+(1).to_s

           elsif x.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && x.any?{|i| board.position(i+1) == " "}
            move = x.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
           end #---end if inside do---

         end #---end do---

         move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end #---end first if ---
      move

    end #---end def move---

  end #---end class---

end #---end module---
