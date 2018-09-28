require 'pry'
module Players
  class Computer < Player
	  def move(board)
	    @board = board
	    @pattern = Game::WIN_COMBINATIONS
	    @opponent = self.token == 'X' ? 'O' : 'X'
	    tactic = nil
	    if tactic_1
	      tactic = tactic_1
	    elsif tactic_2
	      tactic = tactic_2
	    end
	    puts tactic
	    tactic
    end

#  Private

	 def tactic_1
	   result = nil
	   @pattern.detect do |combo|
	   if @board.cells[combo[0]] == @opponent && @board.cells[combo[1]] == @opponent && !@board.taken?(combo[2]+1)
	     result = combo[2]+1
	   elsif @board.cells[combo[1]] == @opponent && @board.cells[combo[2]] == @opponent && !@board.taken?(combo[0]+1)
	     result = combo[0]+1
	   elsif @board.cells[combo[0]] == @opponent && @board.cells[combo[2]] == @opponent && !@board.taken?(combo[1]+1)
	     result = combo[1]+1
	   end
   end
    result
  end


	def tactic_2
	   if @board.position('5') == @opponent
	     [1, 3, 7, 9].detect {|n| !@board.taken?(n)} || [2, 4, 6, 8].detect {|n| !@board.taken?(n)}

	   elsif @board.position('5') == self.token || !@board.taken?('5')
	     !@board.taken?('5') ? '5' : [2, 4, 6, 8].detect {|n| !@board.taken?(n)} || [1, 3, 7, 9].detect {|n| !@board.taken?(n)}
	   end
	 end
	end
end
