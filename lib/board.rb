class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def update(move, player)
    self.cells[(move.to_i - 1)] = player.token
  end

  def full?
    !self.cells.include?(" ")
  end

  def taken?(move)
    position(move)!= " "
  end

  def valid_move?(move)
    move.to_i.between?(1, 9) && taken?(move) == false ? true : false
  end

  def turn_count
    count = 0
    self.cells.each { |cell| cell != " " ? count += 1 : nil }
    count
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

end
