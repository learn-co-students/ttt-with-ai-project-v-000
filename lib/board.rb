class Board
  def initialize
    @cells = Array.new(9, " ")
  end

  attr_accessor :cells

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

  def position(position)
    self.cells[position.to_i-1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.select {|cell| cell == "X" || cell == "O"}.length
  end

  def taken?(position)
    self.position(position) == "X" || self.position(position) == "O"
  end

  def valid_move?(position)
    !self.taken?(position) && (1..9).include?(position.to_i)
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token if valid_move?(position)
  end

end
