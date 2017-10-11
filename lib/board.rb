class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = nil
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all?{|position| position != " " }
  end

  def turn_count
    count = 0
    self.cells.each{|position| position != " " ? count += 1 : nil}
    count
  end

  def taken?(position)
    self.cells[position.to_i - 1] == 'X' || self.cells[position.to_i - 1] == 'O' ? true : false
  end

  def valid_move?(position)
    self.cells[position.to_i - 1] == " " && position.to_i.between?(1,9) ? true : false
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end

end
