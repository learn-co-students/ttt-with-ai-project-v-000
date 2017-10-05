class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "\n #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} \n\n"
  end

  def initialize
    reset!
  end

  def turn_count
    self.cells.count{ |square| square == "X" || square == "O" }
  end

  def position(i)
    self.cells[i.to_i - 1] if i.to_i.between?(1, 9)
  end

  def update(i, player)
    @cells[i.to_i - 1] = player.token if valid_move?(i)
  end

  def full?
    self.cells.all?{ |square| square == "X" || square == "O"}
  end

  def taken?(index)
    self.cells[index.to_i - 1] == "X" || self.cells[index.to_i - 1] == "O"
  end

  def valid_move?(i)
    !taken?(i) && i.to_i.between?(1,9)
  end

end
