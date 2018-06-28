class Board
  
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def display
    puts " #{self[0]} | #{self[1]} | #{self[2]} "
    puts " #{self[3]} | #{self[4]} | #{self[5]} "
    puts " #{self[6]} | #{self[7]} | #{self[8]} "
  end
  
  def position(move)
    index = self.cells[move - 1]
    index
  end
  
  def update(move, player)
    index = self.position(move)
    self.cells[index] = player.token
  end
  
  def full?
    self.turn_count == 9 ? true : false
  end
  
  def turn_count
    count = self.cells.count{|cell| cell != " "}
    count
  end
  
  def taken?(move)
    index = self.position(move)
    self.cells[index] == " " ? false : true
  end
  
  def valid_move?(move)
    index = self.position(move)
    ((0..8) === index && self.taken?(index) == false) ? true : false
  end
      
end