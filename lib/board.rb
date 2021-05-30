class Board
  attr_accessor :cells
  def initialize
    reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    input = input.to_i
    @cells[input - 1]
  end
  
  def full?
    !@cells.include?(" ")
  end
  
  def turn_count
    9 - @cells.select{|cell| cell == " "}.length
  end
  
  def taken?(input)
    cell = position(input)
    cell == "X" || cell == "O"
  end
  
  def valid_move?(input)
    input = input.to_i
    input > 0 && input < 10 && !taken?(input)
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token if valid_move?(input)
  end

end