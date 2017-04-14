class Board
  attr_accessor :cells

  def initialize()
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count {|c| c != " "}
  end

  def taken?(user_input)
    @cells[user_input.to_i - 1] != " "
  end

  def valid_move?(user_input)
    move = user_input.to_i - 1
    move.between?(0, 8) && !taken?(user_input)
  end

  def update(user_input, player)
    cells[user_input.to_i-1] = player.token
  end

end
