module Players
#in process under construction
  class Computer < Player

    def move (board)
      move = nil
      # start with a middle position if not taken
      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1 && !board.taken?(1)
        move = "1"

      elsif board.turn_count == 2
        move = [2,4,6,8].detect {|m| !board.taken?(m)}.to_s



    


      end


    end
  end
end
