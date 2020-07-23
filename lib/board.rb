class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts ""
  end

#The position method looks up the value of the cells
#at the correct index from the array's perspective.
# All other methods will take input in the user's
# perspective of 1-9 strings and use #position to look
# up the value according to the cells' array index.
  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def update(location, player)
    user_input = location.to_i - 1
    cells[user_input] = player.token
  end

  def full?
    cells.include?(" ") == false
  end

  def turn_count
    @cells.count {|i| i != " "}
  end

  def taken?(location)
    position(location) != " "
  end

  def valid_move?(location)
    !taken?(location) && (location.to_i > 0 && location.to_i < 10)
  end

end
