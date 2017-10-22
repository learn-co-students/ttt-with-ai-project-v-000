class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    line = "-----------"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts line
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts line
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(square)
    @cells[square.to_i - 1]
  end

  def full?
    @cells.select{|cell| cell == " "}.length == 0
  end

  def turn_count
    @cells.select {|cell| cell != " "}.length
  end

  def taken?(square)
    index = square.to_i - 1
    cells[index] != " "
  end

  def valid_move?(index)
    index = index.to_i
    !taken?(index) && index <= cells.length && index > 0
    #this might require &&
  end

  def update(square, player)
    index = square.to_i - 1
    @cells[index] = player.token
  end

end
