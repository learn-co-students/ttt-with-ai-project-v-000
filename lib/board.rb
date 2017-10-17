require 'pry'

class Board

	attr_accessor :cells

	def initialize 
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		#@cells = Array.new(9, " ")
	end


	def reset!
		cells.clear
		cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		#binding.pry
		cells
		#171016 - this and update simply won't pass.  I understand update not passing yet.  #reset! is a mystery to me right now. 
	end

	def display
    	puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    	puts "-----------"
    	puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    	puts "-----------"
    	puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(num)
		# puts "Input position:"
		# input = gets.strip.to_i
		# puts "#{cells[input - 1]}"
		cells[num.to_i-1]
	end


	def full?
		!cells.include?(" ")
	end

	def turn_count
		cells.select { |pos| pos == "X" || pos == "O" }.count
	end

	def taken?(pos)
		cells[pos.to_i-1] != " "
	end

  	def valid_move?(pos)
    	!taken?(pos) && pos.to_i.between?(1,9)
  	end

  	def update

  	end

end
