class Board
  attr_accessor :cells

  def initialize
    @cells = []
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all?{|cell| cell != " "}
  end

  def turn_count
    count = 0
    self.cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(position)
    self.cells[position.to_i - 1] == " " ? false : true
  end

  def valid_move?(position)
    if position.to_i >= 1 && position.to_i <= 9
      return true if !taken?(position)
    else
      return false
    end
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end
end
