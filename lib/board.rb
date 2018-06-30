class Board
  
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(move)
    content = self.cells[move.to_i - 1]
    content
  end
  
  def update(move, player)
    index = move.to_i - 1
    self.cells[index] = player.token
  end
  
  def full?
    self.turn_count == 9 ? true : false
  end
  
  def turn_count
    count = self.cells.count{|cell| cell != " "}
    count
  end
  
  def taken?(cell)
    index = cell.to_i - 1
    self.cells[index] == " " ? false : true
  end
  
  def valid_move?(move)
    index = move.to_i - 1
    ((0..8) === index && self.taken?(move) == false) ? true : false
  end
      
end