class Board

	attr_accessor :cells

	def reset!
		self.cells.clear
		@cells = Array.new(9, " ")
		self.cells
	end

end