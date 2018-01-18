class Board
	
	attr_accessor :cells
	

	
	def reset! 			
		cells.clear
		self.cells = Array.new(9, " ")
	
	end

	def initialize		
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  		puts "-----------"
  		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  		puts "-----------"
  		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(val)
		cells[val.to_i - 1]

	end

	def full?
		if cells.all?{|full| full == "X" || full == "O"}
			true
		else
			false
		end
	end

	def turn_count
		@cells.count{|token| token=="X" || token == "O"}

	end

	def taken?(num)
		if cells[num.to_i-1] == "X" || cells[num.to_i-1] == "O" 
			true
		else
			false
		end

	end

	def valid_move?(index)
		
		if (index.to_i > 0 && index.to_i < 10) && !taken?(index)
			true
		else
			false
		end
	end

	def update(pos, player)
		cells[pos.to_i - 1] = player.token
	end



end
