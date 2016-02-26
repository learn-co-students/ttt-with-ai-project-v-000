class Board
  attr_accessor :cells


  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(location)
    self.cells[location.to_i - 1]
  end

  def full?
    self.cells.all?{|token| token == "X" || token == 'O'}
  end

  def turn_count
    self.cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(location)
    !(position(location).nil? || position(location) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input.to_i)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end
end
