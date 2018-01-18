class Board
  attr_accessor :cells

  def initialize
  	@cells = self.reset!
  end

  def cells
  	@cells
  end

  def reset!
  	self.cells = Array.new(9, " ")
  end

  def display
  	puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  	puts "-----------"
  	puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  	puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
  	input = input.to_i-1
  	cells[input]
  end

  def taken?(cell)
    cell = cell.to_i-1
    if cells[cell] == " "
      false
    else
      true
    end
  end 

  def full?
  	if cells.all? {|cell| cell != " "}
  		true
  	else
  		false
  	end
  end

  def turn_count
  	cells.count {|cell| cell == "X" || cell == "O"}
  end

  def valid_move?(move)
  	move = move.to_i
  	if (move >= 1 && move <= 9) && cells[move-1] == " "
  		true
  	else 
  		false
  	end
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end 

end