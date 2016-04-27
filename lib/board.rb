class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")

  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select {|cell| cell != " "}.count
  end

  def taken?(position)
    self.position(position) != " "
  end

  def valid_move?(input)
    !self.taken?(input) && (1..9).include?(input.to_i)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token if self.valid_move?(input)
  end


end
