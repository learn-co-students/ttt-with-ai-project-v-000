class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def turn_count
    self.cells.count {|pos| pos == "X" || pos == "O"}
  end

  def full?
    self.turn_count == 9
  end

  def taken?(input)
    s = self.position(input)
    if s == "X" || s == "O"
      true
    elsif s == " "
      false
    else
      nil
    end
  end

  def valid_move?(input)
    valid_input = input.to_i >= 1 && input.to_i <= 9
    true if !self.taken?(input) && valid_input
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
end
