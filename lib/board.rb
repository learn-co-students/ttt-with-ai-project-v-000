
require 'pry'

class Board

  attr_accessor :cells

  def initialize
      self.reset!
  end

  def reset!
    self.cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(p = gets)
    self.cells[p.to_i-1]
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end

  def full?
    self.cells.find{|p| p == " "} ? false : true
  end

  def turn_count
    self.cells.select{|p| p != " "}.length
  end

  def taken?(position)
    #self.cells[position.strip.to_i-1] == " " ? false : true
    self.position(position) == " " ? false : true
  end

  def valid_move?(position)
    position.to_i <= 9 && position.to_i >= 1 && !taken?(position.to_i)
  end

end
