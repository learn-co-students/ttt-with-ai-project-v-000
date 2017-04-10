class Board
  attr_accessor :board, :cells

  def initialize
    @cells =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select{ |item| item == "X" || item == "O"}.count
  end

  def taken?(position)
    if self.position(position) == " "
      false
    else
      true
    end
  end

  def valid_move?(move)
    if !taken?(move) && self.to_integer(move).between?(0,8)
      true
    else
      false
    end
  end

  def update(position, player)
    token = player.token
    if valid_move?(position)
      self.cells[self.to_integer(position)] = token

   else
     puts "invalid move, please use position 1-9"
   end
  end

end
