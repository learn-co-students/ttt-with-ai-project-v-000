class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(i)
    cells[input_to_index(i)]
  end

  def taken?(i)
    cells[input_to_index(i)] == " " ? false : true
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.count { |x| x == " " }
  end

  def valid_move?(m)
    !taken?(m) && input_to_index(m).between?(0, 8)
  end

  def update(position, player)
    valid_move?(position) ? cells[input_to_index(position)] = player.token : nil
  end
end
