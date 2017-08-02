require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  def reset! #clears the board  and sets it to a 9 element array
    self.cells.clear
    self.cells =[" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position) #returns the value of the cell indicated by the position
    self.cells[position.to_i - 1]
  end

  def full? #returns true for full board
    if self.cells.any? {|cell| cell == " "} #if this statement is true, return false
      false
    else
      true
    end
  end

  def turn_count
    self.cells.select {|cell| cell if cell == "X" || cell == "O"}.length

  end

  def taken?(position)
    if self.cells[position.to_i - 1] != " "
      true
    else
      false
    end
  end

  def valid_move?(position)
    if (1..9).include?(position.to_i) && !(self.taken?(position))
      true
    else
      false
    end
  end

  def update(position, player) #come back after player classes
      self.cells[position.to_i-1] = player.token
  end

end
