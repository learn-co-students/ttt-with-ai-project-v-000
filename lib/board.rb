class Board
  attr_accessor :cells
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def initialize
    self.reset!
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end
  
  def full?
    board = self.cells.select {|cell| cell == "X" || cell == "O"}
    board.length == 9 ? true : false
  end
  
  def turn_count
    board = self.cells.select {|cell| cell == "X" || cell == "O"}
    board.count
  end
   
  def taken?(input)
    index = input.to_i - 1
    self.cells[index] == "X" || self.cells[index] == "O"
  end
  
  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0, 8) && !taken?(input)
  end
  
  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
  end
end