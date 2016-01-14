require 'pry'

class Computer < Player

	WIN_COMBINATIONS = [[0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]

	def move (board)
		
		
		valid_move = (1..9).select {|num| board.valid_move?(num)}

			#binding.pry

		valid_move.each do |num|
			board_1 = board.cells.dup; board_1[num-1] =  self.token
	    		#binding.pry
			self_array = board_1.map.with_index {|cell,i|  i if cell == self.token}.compact
				#binding.pry
		    WIN_COMBINATIONS.each do |combination|
				return num.to_s if combination.all? {|num| self_array.include?(num-1)}
			end
				#	binding.pry
		end
		
		valid_move.each do |num|
			board_1 = board.cells.dup; board_1[num-1] =  self.opp_token
				opp_array = board_1.map.with_index {|cell,i|  i if cell == self.opp_token}.compact
		    WIN_COMBINATIONS.each do |combination|
				return num.to_s if combination.all? {|num| opp_array.include?(num-1)}
			end
		end

		return "5" if valid_move.include?(5)

		[1,3,7,9].each {|num| return num.to_s if valid_move.include?(num)}

		return valid_move.sample.to_s

	end



	def opp_token
		self.token == "X" ? "O" :"X"
	end

end






