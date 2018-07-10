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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    cells[input_to_index(user_input)]
  end

  def full?
    cells.all?{|cell| cell != " "}
  end

  def turn_count
    cells.count{|cell| cell != " "}
  end

  def taken?(spot)
    position(spot) != " " ? true:false
  end

  def valid_move?(user_input)
    0 < user_input.to_i && user_input.to_i < 10 && !taken?(user_input) ? true:false
  end

  def update(input, player)
    cells[input_to_index(input)] = player.token
  end

end
