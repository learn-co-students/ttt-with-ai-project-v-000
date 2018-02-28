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
    index = user_input.to_i - 1
    cells[index]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    count = 0
    cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(user_input)
    index = user_input.to_i - 1
    cells[index] != " "
  end

  def valid_move?(user_input)
    index = user_input.to_i - 1
    index >= 0 &&
    index <= 8 &&
    !taken?(user_input)
  end

  def update(user_input, player)
    index = user_input.to_i - 1
    cells[index] = player::token
  end
end
