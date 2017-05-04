class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    row1 = " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
    row2 = " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
    row3 = " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "
    line = "-----------"

    puts row1
    puts line
    puts row2
    puts line
    puts row3
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
    valid_move?(position) ? cells[input_to_index(position)] == player.token : nil
  end
end
