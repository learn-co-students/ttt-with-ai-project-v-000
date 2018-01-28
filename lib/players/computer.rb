module Players
	class Computer < Player

    WIN_COMBINATIONS = [
	    [0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6],
		]

	  def move(board)
	  	self.token == "X" ? enemy_token = "O" : enemy_token = "X"
	  	final_position = nil
	    WIN_COMBINATIONS.each do |i|
	      if board.cells[i[0]] == enemy_token && board.cells[i[1]] == enemy_token && board.cells[i[2]] == " " ||
	      	board.cells[i[0]] == self.token && board.cells[i[1]] == self.token && board.cells[i[2]] == " "
	      	position = i[2]
	      	final_position = (position + 1).to_s
	      elsif board.cells[i[0]] == enemy_token && board.cells[i[2]] == enemy_token && board.cells[i[1]] == " " ||
	      	board.cells[i[0]] == self.token && board.cells[i[2]] == self.token && board.cells[i[1]] == " "
	      	position = i[1]
	      	final_position = (position + 1).to_s
	      elsif board.cells[i[1]] == enemy_token && board.cells[i[2]] == enemy_token && board.cells[i[0]] == " " ||
	      	board.cells[i[1]] == self.token && board.cells[i[2]] == self.token && board.cells[i[0]] == " "
	        position = i[0]
	      	final_position = (position + 1).to_s
	      elsif board.cells[i[0]] == self.token && board.cells[i[1]] == " " && board.cells[i[2]] == " "
            position_index = rand(1..2)
            position_index == 1 ? final_position = (i[2]+1).to_s : final_position = (i[1]+1).to_s
          elsif board.cells[i[0]] == " " && board.cells[i[1]]  == self.token && board.cells[i[2]] == " " 
          	position_index = rand(1..2)
            position_index == 1 ? final_position = (i[2]+1).to_s : final_position = (i[0]+1).to_s
           elsif board.cells[i[0]] == " " && board.cells[i[1]]  == " " && board.cells[i[2]] == self.token
          	position_index = rand(1..2)
            position_index == 1 ? final_position = (i[1]+1).to_s : final_position = (i[0]+1).to_s
	      end
	    end 
	    if final_position != nil
	      final_position
        else 
          position = 5
		  while board.taken?(position)
		     position = rand(1..9)
		  end
		 position.to_s
	    end
	  end

	end
end


