class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    row = []
    row[0] = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    row[1] = " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    row[2] = " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "

    puts row[0]
    puts "-----------"
    puts row[1]
    puts "-----------"
    puts row[2]
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    self.cells.all?{|c| c == "X" || c == "O"}
  end

  def turn_count
    self.cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)
    !self.taken?(input) if input.to_i > 0 && input.to_i <= self.cells.size
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token if valid_move?(input)
  end

end
