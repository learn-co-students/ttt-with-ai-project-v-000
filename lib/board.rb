require 'pry'

class Board
  
  attr_accessor :cells

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def initialize
    self.reset!
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "\n"
  end
  
  def position(index)
    cells[index.to_i - 1]
  end
  
  def full?
    !cells.any? {|move| move == " " || move == ""}
  end
  
  def turn_count
    cells.count {|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def taken?(index)
    cells[index.to_i - 1] != " "
  end
  
  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end
  
  def update(index, token)
    cells[index.to_i - 1] = current_player
  end
  
end