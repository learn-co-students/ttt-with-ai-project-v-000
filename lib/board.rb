class Board
  attr_accessor :cells
  def initialize
  	reset!
  end

  def reset!
  	@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
  	puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  	puts "-----------"
  	puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  	puts "-----------"
  	puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
  	@cells[input.to_i-1]
  end

  def update(move, player)
  	if valid_move?(move)
  		@cells[move.to_i-1] = player.token
  		display
  	else 
  		return false
  	end
  end

  def valid_move?(move)
  	if move.to_i >= 1 && move.to_i <= 9
  		if taken?(move.to_i)
  			return false
  		else return true
  		end
  	else return false
  	end
  end

  def full?
  	if @cells.detect{|cell| cell == " "} == nil
  		return true
  	else return false
  	end
  end

  def turn_count
  	turns = @cells.select do |cell|
  		cell != " "
  	end
  	turns.count
  end

  def taken?(index)
  	if position(index) == " "
  		return false
  	else return true
  	end
  end
end