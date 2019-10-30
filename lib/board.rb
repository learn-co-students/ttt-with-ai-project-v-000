class Board
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(str)
    square = str.to_i - 1
    self.cells[square]
  end

  def full?
    !@cells.any? { |x| x == " " }
  end

  def turn_count
    @cells.count { |x| x != " " }
  end

  def taken?(str)
    square = str.to_i - 1
    self.cells[square] == " " ? false : true
  end

  def valid_move?(str)
    if str.to_i != 0
      self.taken?(str) ? false : true
    end
  end

  def update(str, player)
    square = str.to_i - 1
    self.cells[square] = player.token
  end

end
