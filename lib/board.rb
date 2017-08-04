require 'pry'
class Board


  attr_accessor :cells
  


  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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
  end

  def input_to_index(input)
    n = input.to_i - 1
    n
  end

  def position(input)
    n = input.to_i - 1
    self.cells[n]
  end

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    counted = self.cells.count("X") + self.cells.count("O")
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(move)
    player_choice = position(move)
    valid_position = input_to_index(move)
    if taken?(move) == false  && valid_position.between?(0,8)
      true
    end
  end

  def update(move, player)
    position = input_to_index(move)
    if self.valid_move?(move) && position.between?(0,8)  
      self.cells[position] = player.token
    end
  end

end
