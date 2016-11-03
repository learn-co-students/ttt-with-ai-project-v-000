class AI
	
  
  def available_moves
  	#return all indexex with empty string
  	moves = []
  	@board.cells.each.with_index do |cell, index| 
  		moves << index if cell == " "
  	end
  	moves	   
  end

  	    
end