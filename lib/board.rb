class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
    (1..9).to_a.include?(user_input.to_i) && !self.taken?(user_input)
  end

  def update(user_input, player)
    cells[user_input.to_i - 1] = player.token
  end
end