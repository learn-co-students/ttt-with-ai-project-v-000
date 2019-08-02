class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def taken?(index)
    !(self.position(index).nil? || self.position(index) == " ")
  end

  def full?
    !self.cells.any? { |e|  e == " " }
  end

  def turn_count
    i = 1
    count = 0
    while i < 10 do
      count += 1 if self.taken?(i)
      i += 1
    end
    count
  end

  def valid_move?(index)
    !self.taken?(index) && index.to_i.between?(1, 9)
  end

  def update(input, player)
    index = input.to_i - 1
    self.cells[index] = player.token
  end

end
