module Players
  class Computer < Player
    attr_reader :game
    
    def corner_move(board)
      corners = ["1", "3", "7", "9"]
      corners.shuffle.detect {|corner| !board.taken?(corner)}
    end

    def winning_move(board)
      winning_combination = game.almost_won?
      winning_combination.detect {|position| !board.taken?(position)}
    end
    
    def defensive_move(board)
      defensive_combination = game.almost_lost?
      defensive_combination.detect {|position| !board.taken?(position)}
    end    
    
    def early_move(board)
      potential_winning_combination = game.early?
      potential_winning_combination.shuffle.detect {|position| !board.taken?(position)}
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
        winning_move(board)
      elsif game.almost_lost?
        defensive_move(board)
      #binding.pry
      else 
        early_move(board)
      end
    end
    
  end 
end 