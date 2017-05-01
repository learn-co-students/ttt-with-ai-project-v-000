class Board
  attr_accessor :board, :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts"-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    location =  to_integer(position)
    self.cells[location]

  end

  def to_integer(input)
    integer = input.to_i
    integer -= 1
    integer
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    self.cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(position)
    if self.position(position) == " "
      false
    else
      true
    end
  end

  def valid_move?(move)
    !taken?(move) && self.to_integer(move).between?(0,8)
  end

  def update(position, player)
    token = player.token
    self.cells[self.to_integer(position)] = token

  end

end
