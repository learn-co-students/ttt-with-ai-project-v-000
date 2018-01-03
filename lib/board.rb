class Board
  require 'pry'
  attr_accessor :cells,

  def cells
    @cells = []
  end

  def reset!
    self.cells.clear
    @cells = Array.new(9," ")
  end

  def initialize
    @cells = Array.new(9," ")
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
    self.cells[input]
  end

  def full?
    if self.cells.include?(" ") == false
      true
    end
  end

  def turn_count
    self.cells.count - self.cells.count(" ")
  end

  def taken?(input)
    input = input.to_i-1
    if self.cells[input] == " "
      false
    else
      true
    end
  end

  def valid_move?(input)
    input = input.to_i
    if input.between?(1,9) && self.taken?(input) == false
      true
    else
      false
    end
  end

  def update(input, player)
    input = input.to_i-1
    self.cells[input] = player.token
  end
end
