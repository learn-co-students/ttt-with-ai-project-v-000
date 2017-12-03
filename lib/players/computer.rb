module Players
  class Computer < Player
    def move(board)
      counter = 1
      output = nil
        while counter <= 9
          if !board.taken?(counter)
            output = counter.to_s
          end
          counter +=1
        end
        output
      end


  end #END OF computer
end #END OF PLAYERS
