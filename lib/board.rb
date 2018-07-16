class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
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

  def position(num)
    self.cells[num.to_i - 1]
  end

  def full?
    !self.cells.any? {|cell| cell == " "}
  end

  def turn_count
    turns = self.cells.select {|cell| cell != " "}
    turns.size
  end

  def taken?(num)
    position(num) == "X" || position(num) == "O"
  end

  def valid_move?(num)
    num.to_i >= 1 && num.to_i <= 9 && !taken?(num)
  end

  def update(num, player)
    self.cells[num.to_i - 1] = player.token
  end
end