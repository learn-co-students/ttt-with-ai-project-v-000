require 'pry'
class AI
	
  def available_moves
  	#return all indexex with empty string
  	moves = []
  	@board.cells.each.with_index do |cell, index| 
  		moves << index+1 if cell == " "
  	end
  	moves	   
  end

  def get_new_state(move)
    player = self.current_player
    @board.update(move, player) if self.board.valid_move?(move)
    @board.cells 
  end

  	    
end