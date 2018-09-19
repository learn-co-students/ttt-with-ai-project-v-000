class Board
  attr_accessor :cells

  def initialize
    self.reset!
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
    if self.cells.any? {|x| x == " "}
      return false
    else
      return true
    end
  end

  def turn_count
    turns = self.cells.select {|x| x != " "}.size
  end

  def taken?(cell)
    if self.cells[cell.to_i - 1] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(cell)
    if !taken?(cell) && cell.to_i > 0 && cell.to_i <= 9
      return true
    else
      return false
    end
  end

  def update(cell, player)
    if valid_move?(cell)
      self.cells[cell.to_i - 1] = player.token
    end
  end


end
