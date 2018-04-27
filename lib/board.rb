class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    self.cells.reject {|cell| cell == " "}.size
  end

  def taken?(user_input)
    # position(user_input) == "X" || position(user_input) == "O"
    position(user_input) != " "
  end

  def valid_move?(user_input)
    user_input.to_i >= 1 && user_input.to_i <= 9 && !taken?(user_input)
  end

  def update(user_input, player)
    self.cells[user_input.to_i - 1] = player.token
     position(user_input)
  end
end
