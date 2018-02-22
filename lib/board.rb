class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = []
    9.times {cells << " "}
    self.cells
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i-1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    i=0
    self.cells.each {|c| i+=1 unless c == " "}
    i
  end

  def taken?(position)
    self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  end

  def valid_move?(position)
    (1..9).include?(position.to_i) && !taken?(position)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player::token
  end

end
