class Board
  #attributes and Variables
  attr_accessor :cells

  #modules

  #initialize
  def initialize
    reset!
  end

  #class methods

  #instance methods
  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} " "|" " #{cells[1]} " "|" " #{cells[2] } "
    puts "-----------"
    puts " #{cells[3]} " "|" " #{cells[4]} " "|" " #{cells[5] } "
    puts "-----------"
    puts " #{cells[6]} " "|" " #{cells[7]} " "|" " #{cells[8] } "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  def update(input, player)
    if self.valid_move?(input)
      cell = input.to_i-1
      cells[cell] = player.token
    end
  end

end
