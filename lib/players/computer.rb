module Players
  class Computer < Player
    def move(board)
      counter = 1
      output = nil
        while counter <= 9
          if !board.position_taken?(counter)
            output = counter
          end
          counter +=1
        end
        output
      end


  end #END OF computer
end #END OF PLAYERS
