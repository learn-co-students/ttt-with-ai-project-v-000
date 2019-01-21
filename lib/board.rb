class Board

attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end
  
  def display
    str = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "\
    "-----------"\
    " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "\
    "-----------"\
    " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "\
    "-----------"
    
    puts str
  end
  
  def position(value)
    value = value.to_i
    value <= 0 ? nil : self.cells[value-1]
  end
  
  def full?
    self.cells.none? {|cell| cell == " "}
  end
  
  def turn_count
    self.cells.select {|cell| cell != " "}.length
  end
  
  def taken?(value)
    position(value) != " "
  end
  
  def valid_move?(value)
    position(value) == " "
  end
  
  def update(value, player)
    cells[position(value).to_i] = player.token
  end
    
end
