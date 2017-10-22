class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} " + '|' + " #{cells[1]} " + "|" + " #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} " + '|' + " #{cells[4]} " + "|" + " #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} " + '|' + " #{cells[7]} " + "|" + " #{cells[8]} "
  end

  def position(input)
    self.cells[(input.to_i-1)]
  end

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    self.cells.select {|c| c != " "}.size
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O" ? true : false
  end

  def valid_move?(input)
    (1..9).include?(input.to_i) && !self.taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token if self.valid_move?(input)
  end

end
