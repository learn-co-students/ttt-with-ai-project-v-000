class Board
  attr_accessor :cells

  def initialize
    self.reset!
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
    (user_input.to_i - 1).to_str
    # board_input
  end

  def full?
    @cells.all? do |position|
      position == "X" || position == "O"
    end
  end

  def turn_count
  end

  def taken?
  end

  def valid_move?
  end

  def update
  end

end
