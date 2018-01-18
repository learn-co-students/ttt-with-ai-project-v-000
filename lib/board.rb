class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    self.reset!
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
    self.cells.all? {|cell| cell != " "}
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(user_input)
    self.position(user_input) != " "
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9) && !taken?(user_input)
  end

  def update(user_input, player)
    cells[user_input.to_i - 1] = player.token
  end
end
