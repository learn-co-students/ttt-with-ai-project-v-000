require 'pry'
module Players
  class Computer < Player

    def move(board)
      if !@board.taken?("5")
        "5"
      end
    end


  end
end

1. Checks board positions to make sure board has open spots using the !taken? method
2. Takes in a string as input and puts it on board
3. If computer is first player place token in middle a.k.a positon 5, no need to check for turn_count
4. If computer is second player aka turn_count is not even, place token in corner position if position 5 has been taken else position 5
5. If computer went first and took the middle on first move, take an open corner. Corners = [1,3,7,9]
5.1 
6. Check if any of combos within WIN_COMBINATIONS has two spots filled through iteration
7. Winning! If two spots filled are my token, fill third spot with my token
8. Blocking! If two spots filled are NOT my token, fill thrid spot with my token
9. move
