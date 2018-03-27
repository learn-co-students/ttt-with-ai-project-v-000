class Board
  attr_accessor :cells

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    i=-1
    puts " #{cells[i+=1]} | #{cells[i+=1]} | #{cells[i+=1]} "
    puts "-----------"
    puts " #{cells[i+=1]} | #{cells[i+=1]} | #{cells[i+=1]} "
    puts "-----------"
    puts " #{cells[i+=1]} | #{cells[i+=1]} | #{cells[i+=1]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    !cells.detect {|cell| cell == " "}
  end

  def turn_count
    count = 0
    cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(input)
    cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    cells[input.to_i - 1] == " " && input.to_i.between?(1,9)
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
  end

end
