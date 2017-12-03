module Players
  class Computer < Player
    # https://neverstopbuilding-dropblog.herokuapp.com/minimax is a bit too extensive for this
    def move(board) #no decision logic, but plays the game for the purposes of the assignment.
      counter = 1
      output = nil
        while counter <= 9
          if !board.taken?(counter)
            output = counter.to_s
          end
          counter +=1
        end
        sleep(1)
        output
      end


  end #END OF computer
end #END OF PLAYERS
