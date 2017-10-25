class Board

	attr_accessor :cells, :win_combinations

	def initialize
		reset!
	end


	def reset!
		@cells = Array.new(9, " ")
		#The only way to get this test to pass was to put @cells.  Just "cells = ..." wouldn't work.
		#cTried many different things here.

	end

	def display
    	puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    	puts "-----------"
    	puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    	puts "-----------"
    	puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(num)
		cells[num.to_i-1]
	end

	def full?
		cells.all? {|cell| cell != " "}
	end

	def turn_count
		 cells.count { |cell| cell == "X" || cell == "O" }
	end

	def taken?(pos)
		cells[pos.to_i-1] != " "
	end

  def valid_move?(pos)
  	pos.to_i.between?(1,9) && !taken?(pos)
	end

  def update(pos, player)
		cells[pos.to_i - 1] = player.token
	end

end
