require 'pry'

class Board 
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def index(input)
    input.to_i - 1
  end
  
  def position(user_input)
    array_index = index(user_input)
    @cells[array_index]
  end
  
  def full?
    @cells.all? do |position|
      position == "X" || position == "O"
    end
  end
  
  def turn_count
    counter = 0
    @cells.each do|position|
      if position == "X"
        counter += 1
      elsif position == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def taken?(input)
    array_index = index(input)
    @cells[array_index] != " " && @cells[array_index] != ""
  end
  
  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index) 
  end
  
  def update(input, player)
    array_index = index(input)
    @cells[array_index] = player.token
  end
  
end