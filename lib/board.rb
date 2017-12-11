class Board
  attr_accessor :cells

  @cells = []

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
    self.cells.all? { | entry | entry == "X" || entry == "O" }
  end

  def turn_count
    self.cells.count{ | x | x == "X" || x == "O" }
  end

  def taken?(position)
    self.position(position) == "X" || self.position(position) == "O"
  end

  def valid_move?(position)
    position.to_i >= 1 && position.to_i <= 9 && self.position(position) == " "
  end

  def update(position, player)
    if valid_move?(position)
      self.cells[position.to_i-1] = player.token
    end
  end
end
