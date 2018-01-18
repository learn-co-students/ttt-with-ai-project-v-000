require 'pry'
class AI

	#return all indexex with empty string
  def get_available_moves
  	moves = []
  	@board.cells.each.with_index do |cell, index| 
  		moves << index+1 if cell == " "
  	end
  	moves	   
  end

  #update the board
  def get_new_state(move)
    player = self.current_player
    @board.update(move, player) if self.board.valid_move?(move)
    @board.cells 
  end

  	    
end