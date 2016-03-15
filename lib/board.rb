require 'pry'
require_relative "player.rb"

class Board
	attr_accessor :cells

	def initialize
		@cells = []
		reset!
		#binding.pry
	end

	 #combinations where the other player is 1 turn from winning
  BLOCK_COMBO = [
    {[0,1] => 2},
    {[3,4] => 5},
    {[6,7] => 8},
    {[1,2] => 0},
    {[4,5] => 3},
    {[7,8] => 6},
    {[0,3] => 6},
    {[2,5] => 8},
    {[1,4] => 7},
    {[0,4] => 8},
    {[2,4] => 6},
    {[4,8] => 0},
    {[4,6] => 2},
    {[5,8] => 2},
    {[4,7] => 1},
    {[3,6] => 0},
  ]

  def block?(token)
  	a = nil
  	BLOCK_COMBO.each do |hash|
      hash.each do |combo, mov|
        if position(combo[0]+1) != token && position(combo[0]+1) != " " && position(combo[1]+1) != token && position(combo[1]+1) != " " && !taken?(mov+1)
        	binding.pry
        	a=mov
        end
      end
    end
    a
  end

	def reset!
		@cells = []
		9.times do 
			@cells << " "
		end
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end


	#returns position from the array
	def position(input)
		i = input.to_i
		@cells[i-1]
	end

	#Changes position with player token. Should be coupled with #taken?
	def update(pos, player)
		i = pos.to_i
		@cells[i-1] = player.token
	end


	#returns true when all positions are full
	def full?
		@cells.all? {|cell| cell == "X" || cell == "O"}
	end


	#keeps track of turn ccount based on occupied cells
	def turn_count
		count = 0
		@cells.each do |cell|
			if cell == "X" || cell == "O"
				count +=1
			end
		end
		count
	end


	#Returns true if the position is taken
	def taken?(pos)
		position(pos) == "X" || position(pos) == "O"
	end

	#checks to see if the position passed is taken and if it falls within board
	def valid_move?(pos) 
		!taken?(pos) && pos.to_i.between?(1,9)
	end

end

