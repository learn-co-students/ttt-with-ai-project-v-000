class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
    puts ""
  end
  
  def position(input)
    cells[input.to_i - 1]
  end
  
  def full?
    cells.all?{ |token| token == "X" || token == "O"}
  end
  
  def turn_count
    turns = 0
    cells.each {|cell| if cell != " " then turns +=1 end }
    turns
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  
  def valid_move?(input)
    (1..9).include?(input.to_i) && !taken?(input)
  end
  
  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
  
end