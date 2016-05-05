require 'pry'


class Board

  attr_accessor :cells
  
  def initialize(cells = Array.new(9, " "))
    @cells = cells 
  end

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input) 
    self.cells[input.to_i-1]
  end

  def update(input, player) 
    self.cells[input.to_i-1] = player.token
  end

  def full?
    if self.cells.any? {|s| s == " "}
      false
    else 
      true
    end
  end

  def turn_count
    self.cells.count {|s| s == "X" || s == "O"}
  end

  def taken?(input)
    if self.cells[input.to_i-1] == " "
      false
    else 
      true
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && taken?(input) == false
      true
    end
  end


end

