require_relative '../player.rb'


class Computer < Player
	attr_accessor :try, :other_token, :threat, :opp
	
	def opportunity?(board)
		self.opp = Game::WIN_COMBINATIONS.select do |x| 
		(board.cells[x[0]] == self.token && board.cells[x[1]] == self.token && board.cells[x[2]] == " ") ||
		(board.cells[x[1]] == self.token && board.cells[x[2]] == self.token && board.cells[x[2]] == " ") || 
		(board.cells[x[2]] == self.token && board.cells[x[0]] == self.token && board.cells[x[1]] == " ")
		end
		self.opp.count >= 1
	end
	
	def threat?(board)
		self.threat = Game::WIN_COMBINATIONS.select do |x| 
			(board.cells[x[0]] == self.other_token && board.cells[x[1]] == self.other_token && board.cells[x[2]] == " ") || 
			(board.cells[x[1]] == self.other_token && board.cells[x[2]] == self.other_token && board.cells[x[0]] == " ") ||
			(board.cells[x[2]] == self.other_token && board.cells[x[0]] == self.other_token && board.cells[x[1]] == " ") 
		end
		self.threat.count >= 1
	end
	
	def outer_threat?(board)
		self.threat = Game::WIN_COMBINATIONS.select do |x| 
		(board.cells[x[0]] == self.other_token || board.cells[x[1]] == self.other_token || board.cells[x[2]] == self.other_token) && !(board.cells[x[0]] == self.token || board.cells[x[1]] == self.token || board.cells[x[2]] == self.token)
		end
		self.threat.flatten!
		self.threat = self.threat.select { |x| board.cells[x] == " " && self.threat.count(x)>1}
		!self.threat[0].nil?
	end
	def move(board)
		if self.token == "X"
			self.other_token= "O"
		else
			self.other_token= "X"
		end
		
		if self.opportunity?(board)
			self.opp[0].each { |x| self.try = x+1 if board.cells[x] == " " }
		elsif self.threat?(board)
			self.threat[0].detect { |x| self.try = x+1 if board.cells[x] == " " }
		elsif self.outer_threat?(board)
			self.try = self.threat[0]+1
				
		else
			
				loop do
				self.try=(rand(9)+1)
				break if board.cells[self.try-1] == " "
				end
		end
		self.try.to_s
	end
end
