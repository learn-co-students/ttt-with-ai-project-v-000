require 'pry'

class Board

	attr_accessor :cells

	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end


	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		#The only way to get this test to pass was to put @cells.  Just "cells = ..." wouldn't work.  Tried many different things here.

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
		!cells.include?(" ")
	end

	def turn_count
		cells.select { |pos| pos == "X" || pos == "O" }.count
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
