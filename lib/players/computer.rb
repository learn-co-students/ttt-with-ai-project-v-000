require('pry')

module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1","2","3","4","5","6","7","8","9"].select {|m| board.valid_move?(m)} # only check valid moves
      scores = valid_moves.collect {|i|  [i,score_move(i,board)]}
      sorted = scores.sort {|i,j| j[1] <=> i[1]} # sort the scores by score
      sorted[0][0] # return the move with the highest score
    end

    def score_move(position,board)
      score = 0
      relevant_combos = Game::WIN_COMBINATIONS.select{|c| c.include?(position.to_i-1)}
      relevant_combos.each do |combo|
        tokens=["#{board.cells[combo[0]]}", "#{board.cells[combo[1]]}", "#{board.cells[combo[2]]}"]
        score+=score_combo(tokens)
      end
      score
    end

    def score_combo(tokens)
      mine = tokens.count(self.token)
      theirs = tokens.count(self.opponent_token)
      blanks = tokens.count(" ")
      if blanks==0  then return 0
      elsif mine==2 then return 7
      elsif theirs==2 then return 6
      elsif mine==1 && blanks==2 then return 3
      elsif blanks == 3  then return 2
      elsif theirs==1 && blanks==2 then return 1
      else return 0
      end
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

loop through each board position
  if the position is valid_move
    is it an instant win? --> pick it! -> score 7
    does it prevent opponent from winning next turn?  --> pick it! - score 6
    calculate the score if this move by looping through the relevent win combinations
      summing their scores
        +3 for each combo that has at least one of our tokens in it
        +2 for each combo that is blank
        +1 for each combo that has 1 oppenent token
    pick the move that has the highest score
=end
