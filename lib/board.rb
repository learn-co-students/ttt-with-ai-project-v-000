require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    index = input_to_index(input)
    cells[index]
  end

  def full?
    cells.detect{|cell| cell == " "}? false : true
  end

  def turn_count
    count = 0
    cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(input)
    index = input_to_index(input)
    cells[index] != " " ? true : false
  end

  def valid_move?(input)
    index = input_to_index(input)
    if index >= 0 && index <= 9
      !self.taken?(input)
    else
      false
    end
  end

  def update(input,player)
    #binding.pry
    index = input_to_index(input)
    cells[index] = player.token
  end

  def input_to_index(input)
    input.to_i - 1
  end
end
