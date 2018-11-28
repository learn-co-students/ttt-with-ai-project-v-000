module Players
  class Computer < Player 

    def corner_move(board)
      corners = ["1", "3", "7", "9"]
      corners.shuffle.detect {|corner| !board.taken?(corner)}
    end

    def winning_move
      winning_combination = game.almost_won?
      #need to return final position here
    end
    
    def early_move
      potential_winning_combination = game.early?
      # need to return _one_ of the two potential positions
    end
    
    def move(board)
      puts "Your turn, #{token}. Where would you like to go?"
      if board.turn_count == 0
        "5"
      elsif board.turn_count == 1
        if board.taken?("5")
          corner_move(board)
        else
          "5"
        end
      elsif game.almost_won?
        winning_move
      else 
        early_move
      end
    end
    
  end 
end 