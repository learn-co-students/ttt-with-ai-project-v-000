class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
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
    self.cells.none?{|cell| cell == " "}
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      if cell == "X" || cell == "O"
        count +=1
      end
    end
    count
  end

  def taken?(cell)
    self.cells[cell.to_i - 1] != " "
  end

  def valid_move?(cell)
    !self.taken?(cell) && cell.to_i < 10 && cell.to_i > 0
  end

  def update(cell, player)
    self.cells[cell.to_i - 1] = player.token
  end

end
