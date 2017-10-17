class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    self.cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  def position(user_input)
  cells[user_input.to_i - 1]
  end

  def full?
  cells.all?{|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
     position(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
  if user_input.to_i.between?(1, 9) && (position(user_input) == " " || position(user_input) == "")
    true
  else
    false
  end
  end

  def update(user_input, player)
    cells[user_input.to_i - 1] = player.token
  end

  def turn_count
    count = 0
  cells.each do |token|
    if token == "X" || token == "O"
      count += 1
  end
  end
  return count
  end

end
