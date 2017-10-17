class Players::Computer < Player
		
		def move(board)
			#move_arr = ["1", "2","3","4","5","6","7","8","9"]
			#move_arr.sample
		corners = ["1","3","7","9"]
		middle = ["2","4","6","8"]
		choice = ""
			
			if board.cells[4] == " "
				choice = "5"
				#binding.pry
			elsif corners.detect do |c| 
					if board.cells[c.to_i - 1] == " "
						choice = c 
					end
				end
			elsif middle.detect do |c| 
					if board.cells[c.to_i - 1] == " "
						choice = c 
					end	
				end	
			end
			choice
		end
	
end