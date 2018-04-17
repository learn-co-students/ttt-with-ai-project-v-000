class Board
  attr_accessor :cells


  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    input = input.to_i
    cells[input - 1]
  end
  
  def valid_move?(input)
    input = input.to_i
    input.between?(1,9) && !(taken?(input))
  end

  def update(input, player)
    input = input.to_i
    cells[input.to_i - 1] = player.token
  end
  
  def full?
    cells.all? {|token| token == "X" || token == "O"}
  end

   def turn_count
   cells.count {|pos| pos == "X" || pos == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
end 


