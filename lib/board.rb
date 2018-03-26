class Board
  attr_accessor :cells

  def initialize(board = nil)
    @cells = board || Array.new(9, " ") 

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

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    self.cells.select{|c| c == "X" || c == "O"}.count
  end

  def taken?(input)
    (self.cells[input.to_i - 1] == "X" || self.cells[input.to_i - 1] == "O") ? true : false
  end

  def valid_move?(input)
    ((1..9).to_a.include?(input.to_i) && !taken?(input.to_i)) ? true : false
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token if (valid_move?(input) && !taken?(input))
  end

end
