class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    puts self.cells[0..2].collect {|c| " #{c} "}.join("|")
    puts "-----------"
    puts self.cells[3..5].collect {|c| " #{c} "}.join("|")
    puts "-----------"
    puts self.cells[6..8].collect {|c| " #{c} "}.join("|")
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.turn_count == 9
  end

  def turn_count
    (1..9).count {|pos| self.taken?(pos)}
  end

  def taken?(input)
    self.position(input.to_i) == "X" || self.position(input.to_i) == "O"
  end

  def valid_move?(input)
    (1..9).include?(input.to_i) && !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

end
