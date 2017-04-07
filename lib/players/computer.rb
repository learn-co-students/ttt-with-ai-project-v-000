module Players
  class Computer < Player
    def move(board)
      
    end
  end
end

=begin
possibilities (assume my token is A)
 A, A, blank         - score this highest because we win!
 B, B, blank         - score this high, because otherwise we will lose next turn
 A, blank, blank     - better than nothing, score 3
 blank, blank, blank - baseline value... score 2
 B, blank, blank     - score low, can't win with this combo, but at least we block a win, score 1
 A, B, blank         - no chance of winning with this combo, score 0
 B, A, blank         - no chance of winning with this combo, score 0

loop through each board position
  if the position is valid_move
    is it an instant win? --> pick it!
    does it prevent opponent from winning next turn?  --> pick it!
    calculate the score if this move by looping through the win combinations 
      summing their scores 
        +3 for each combo that has at least one of our tokens in it
        +2 for each combo that is blank
        +1 for each combo that blocks a win
    pick the move that has the highest score
=end