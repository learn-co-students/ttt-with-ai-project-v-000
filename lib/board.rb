class Board

  attr_accessor :cells

  def initialize
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------------------------------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------------------------------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def position(number)
    self.cells[number.to_i-1]
  end

  def full?
    self.cells.none? {|cell| cell == " "}
  end

  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(number)
    self.position(number) != " "
  end

  def valid_move?(number)
    !self.taken?(number) && number.to_i.between?(1,9)
  end

  def update (number, player)
    self.cells[number.to_i-1] = player.token if valid_move?(number)
  end

end
