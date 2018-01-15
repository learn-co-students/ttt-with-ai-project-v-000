class Board
  attr_accessor :cells

  @cells = []

  def initialize
    self.reset!

  end

  def cells
    @cells
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(index)
    self.cells[index.to_i - 1]
  end

  def full?
    self.cells.include?(" ")? false: true
  end

  def turn_count
    9-self.cells.count(" ")
  end

  def taken?(index)
    self.cells[index.to_i - 1] != " "? true : false
  end

  def valid_move?(index)
    (1..9).include?(index.to_i) && !self.taken?(index) ? true : false
  end

  def update(index, player)
    self.cells[index.to_i - 1] = player.token
  end

end
