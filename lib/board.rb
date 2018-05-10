class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i - 1]
  end
  
  def full?
    !(@cells.include?(" "))
  end
  
  def turn_count
    9 - @cells.count(" ")
  end
  
  def taken?(input)
    position(input) != " "
  end
  
  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token if valid_move?(input)
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end
  
  
end