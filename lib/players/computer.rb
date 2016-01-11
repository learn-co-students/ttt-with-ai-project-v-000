require_relative '../player.rb'


class Computer < Player
	attr_accessor :try
	def move(board)
		loop do
		self.try=(rand(9)+1)
		break if board.cells[self.try] == " "
		end
		self.try.to_s
	end
end

