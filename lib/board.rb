class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

#   WIN_COMBINATIONS = [
#   [0, 1, 2], [3, 4, 5], [6, 7, 8],
#   [0, 3, 6], [1, 4, 7], [2, 5, 8],
#   [0, 4, 8], [2, 4, 6]
# ]

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
    cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{|square| square != " " }
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
   input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end