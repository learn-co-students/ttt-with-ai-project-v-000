class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    separator_row = "-----------"
    row1 = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    row2 = " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    row3 = " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "#{row1}\n#{separator_row}\n#{row2}\n#{separator_row}\n#{row3}"
  end

  # cell is physical location; index is the array index.
  def position(cell)
    index = cell.to_i - 1
    (index >= 0 && index <= 8) ? self.cells[index] : nil
  end

  def full?
    self.cells.all? {|positions| positions == "X" || positions == "O"}
  end

  def turn_count
    self.cells.count{|cell| cell == "O" || cell == "X"}
  end

  def taken?(cell)
    (self.position(cell) == "X" || self.position(cell) == "O") ? true : false
  end

  def valid_move?(cell)
    (self.taken?(cell) == true || self.position(cell) == nil) ? false : true
  end

  def valid_player?(player)
    (player == "X" || player == "O") ? true : false
  end

  def update(cell, player)
    player = player.token # why is player passed in as a hash???
    index = cell.to_i - 1
    self.cells[index] = player if (valid_move?(cell) == true && valid_player?(player) == true)
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
end
