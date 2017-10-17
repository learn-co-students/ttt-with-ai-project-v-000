module Players
  class Players::Computer < Player

    def move(board)        
    # if any two indexes of wincombo contain the same character try to see if the 3rd 
    # is a valid move

    # if any = " "
    #   set this to your selection
      
      if board.turn_count == 0
        sleep(2)
        
        puts "Computer #{self.token} played 7"
        return "7"
      end 
      
      if board.turn_count == 1
        sleep(2)
        
        puts "Computer #{self.token} played 5"
        return "5"
      end 

        #choose from a random array of remaining spaces
      spaces = [1,2,3,4,6,8,9]
      random_choice = spaces.sample.to_s


      until board.valid_move?(random_choice)
        random_choice = spaces.sample.to_s
      end 
      
      sleep(2)
      
      puts "Computer #{self.token} played #{random_choice}"
      random_choice
    end
  end 
end 

    #****WARNING - INSANITY BELOW*****

  #     #if turn count is even, it means that the player is X
  #     if board.turn_count.even?
  #       if board.turn_count == 1
  #         input = "6"
  #       end 

  #       #Or, place your second X on an edge square (not a corner), 
  #       #not touching your first X. If your opponent puts down an O in 
  #       #the corner that's not next to your X, you can use your third X to 
  #       #block her move and automatically win with your fourth X.
      
  #       #if the second player plays in the center

  #       if board.turn_count == 3 && board.cells[4] == "O"
  #         input = "2"
  #       end

  #       #turn 5
  #       #if O plays in the bottom corner, x will play in the top corner
  #       if board.turn_count == 5 && board.cells[4] == "O" && board.cells[8] == "O"
  #         input = "1"
  #       #if o played in the top corner, x will play in the bottom corner
  #       elsif board.turn_count == 5 && board.cells[4] == "O" && board.cells[0] == "O"
  #           input = "8"
  #       #if o plays in one of the middle spaces
  #       elsif board.turn_count == 5 && board.cells[4] == "O" && board.cells[5] == "O"
  #         input = "3"
  #       elsif board.turn_count == 5 && board.cells[4] == "O" && board.cells[3] == "O"
  #         input = "5"
  #       elsif board.turn_count == 5 && board.cells[4] == "O" && board.cells[1] == "O"
  #         input = "7"
  #       elsif board.turn_count == 5 && board.cells[4] == "O" && board.cells[7] == "O"
  #         input = "1"
  #       end

  #       #turn 7
  #       if board.turn_count == 7 && board.cells[4] == "O" && board.cells[8] == "O" && board.cells[1] == "O"
  #         input = "3" # win
  #       elsif board.turn_count == 7 && board.cells[4] == "O" && board.cells[0] == "O" && board.cells[7] == "O"
  #         input = "5" #win
  #       elsif board.turn_count == 7 && board.cells[4] == "O" && board.cells[8] == "O" && board.cells[3] == "O"
  #         input = "1" #win
  #       end
  #     end 
  #   end 
  # end
