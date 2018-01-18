class Board

	attr_accessor :cells

	def initialize
		@cells = Array.new(9, " ")
	end

	def reset!
		self.cells.clear
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
	    puts "-----------"
   	    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

	def position(input)
		index= (input.to_i) - 1
		value = self.cells[index]
		value
	end

	def taken?(input)
      index=(input.to_i)-1
  		!(self.cells[index] == " "|| self.cells[index] == "" || self.cells[index]== nil)
	end

	def full?
  		self.cells.all? do |space|
    	space != " "
  		end
	end

	def turn_count
  		counter=0
  		self.cells.each do |spot|
    		if spot == "X" || spot == "O"
      		counter+=1
   			end
  		end
    	return counter
	end

	def valid_move?(input)
  		index = (input.to_i)-1
  		index.between?(0,8) && !taken?(input)
	end

	def update(position, player)
    index=(position.to_i)-1
		self.cells[index] = player.token
	end


end
