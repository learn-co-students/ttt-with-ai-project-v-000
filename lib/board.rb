require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," ",]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
    puts "-----------\n"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
    puts "-----------\n"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," ",]
  end

  def position(input)
    index = (input.to_i-1)
    self.cells[index]
  end

  def full?
    !self.cells.include?(" ") || false
  end

  def turn_count
    # counter = 0
    # self.cells.each {|x| counter +=1 if x == "X" || x == "O"}
    # counter
    self.cells.count {|x| x != " "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(index, player)
    self.cells[index.to_i-1] = player.token
  end

end
