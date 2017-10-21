class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ",
         "-----------",
         " #{cells[3]} | #{cells[4]} | #{cells[5]} ",
         "-----------",
         " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.each_index.all? { |index| taken?(index) }
  end

  def turn_count
    cells.each_index.count { |index| taken?(index) }
  end

  def taken?(user_input)
    position(user_input) != " "
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def update(user_input, player)
    cells[user_input.to_i - 1] = player.token
  end

end
