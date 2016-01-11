class Board
	attr_accessor :cells
	
	def initialize
		@cells = Array.new(9," ")
	end
	
	def reset!
		@cells = @cells.clear
		@cells = Array.new(9, " ")
	end
	
	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n\
-----------\n\
 #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n\
-----------\n\
 #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	 end
	
	def position(pos)
		@cells[pos.to_i-1]
	end
	
	def full?
		!@cells.include?(" ")
	end
	
	def turn_count
		output = 0
		@cells.each { |x| output+=1 if x!= " "}
		output
	end
	
	def taken?(pos)
		@cells[pos.to_i-1]!= " "
	end
	
	def valid_move?(num)
		num.to_i.between?(1,9) && !taken?(num)
	end
	
	def update(pos, player)
		@cells[pos.to_i-1] = player.token
	end
end




