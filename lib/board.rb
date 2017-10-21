class Board

  attr_accessor :cells

  

  def initialize
  	@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def cells
    @cells
  end

  def reset!
  	self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
  	puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
  	puts "-----------"
  	puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
  	puts "-----------"
  	puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(cell)
    self.cells[cell.to_i - 1]
  end

  def full?
  	!self.cells.any? {|cell| cell == " "}
  end

  def turn_count
  	self.cells.count {|cell| cell == "X" or cell == "O"}
  end

  def taken?(position)
  	if self.cells[position.to_i - 1] == "X" or self.cells[position.to_i - 1] == "O"
  	  true
  	else
      false
  	end
  end

  def valid_move?(position)
  	if taken?(position)
      puts "Invalid move"
  	  false
  	elsif position.to_i < 1 or position.to_i > 9
      puts "Invalid move"
  	  false
  	elsif position.to_i == 0
      puts "Invalid move"
  	  false
  	else
  	  true
  	end
  end

  def update(position, player)
  	self.cells[position.to_i - 1] = player.token
  end

end