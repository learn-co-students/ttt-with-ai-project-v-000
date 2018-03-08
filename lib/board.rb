class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def position(n)
    self.cells[n.to_i - 1]
  end

  def full?
    self.cells.all? do |cell|
      cell != " "
    end
  end

  def turn_count
    @counter = 0
    self.cells.each do |cell|
      cell != " " ? @counter += 1 : nil
    end
    @counter
  end

  def taken?(n)
    self.position(n) == " " ? false : true
  end

  def valid_move?(n)
    n.to_i > 0 && n.to_i < 10 ? !self.taken?(n) : false
  end

  def update(n, player)
    self.cells[n.to_i-1] = player.token
  end

end
