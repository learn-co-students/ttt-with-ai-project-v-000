require 'pry'

class Board
  attr_accessor :cells, :player

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts " "
    puts " "
  end

  def position(input)
    index = input.to_i - 1
    self.cells.fetch(index)
  end

  # def input_to_index(input)
  #   index = input.to_i - 1
  # end

  def taken?(input)
    index = input.to_i - 1
    !(self.cells[index] == " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def full?
    self.cells.all?{|object| object == "X" || object == "O"}
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !self.taken?(input)
  end

  def turn_count
    self.cells.count{|object| object == "X" || object == "O"}
  end

  def update(input,player)
    index = input.to_i - 1
    self.cells[index] = player.token
  end

end
