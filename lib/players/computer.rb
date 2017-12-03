module Players
  class Computer < Player
    # https://neverstopbuilding-dropblog.herokuapp.com/minimax is a bit too extensive for this.  Kids give up on TTT becuase it's a zero-sum game, with ties achieving 100%.
    def move(board) #better than below, a good easy opponent.
      @attempt = 1 + rand(9)
      if board.taken?(@attempt)
        move(board)
      elsif !board.taken?(@attempt)
      output = @attempt.to_s
      end
      #sleep(1) this is not working reliably and hangs increasingly long in computer moves, especially towards end of computer/computer game. hmm, Win10ism?  not really necessary but makes it observable.  don't understand why, it's outside the loop.
      output
    end

    def move2(board) #no decision logic, but plays the game for the purposes of the assignment.  Ideally, I'd do 3 difficulty levels with level 3 unbeatable, level 1 being random valid_moves, level 2 blocking
      counter = 1
      output = nil
        while counter <= 9
          if !board.taken?(counter)
            output = counter.to_s
          end
          counter +=1
        end
        sleep(1) #gives illusion of computer thinking, makes board presentation sensible
        output
      end


  end #END OF computer
end #END OF PLAYERS
