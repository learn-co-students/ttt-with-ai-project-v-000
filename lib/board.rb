class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def taken?(input)
    #self.position(input) == "X" || self.position(input) == "O"
    self.position(input) != " "
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select {|cell| cell != " "}.length
    #self.cells.count {|cell_value| cell_value != " "}
  end

  def valid_move?(input)
    (1..9).to_a.include?(input.to_i) && !self.taken?(input)
    #input.to_i.between?(1, 9)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

end
