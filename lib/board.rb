class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end


  def update(inp, player)
    return false if taken?(inp)
    @cells[to_index(inp)] = player.token
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    @cells.select{|i| i != " "}.length == 9
  end

  def turn_count
    @cells.select{|i| i != " "}.length
  end

  def taken?(pos)
    i = to_index(pos)
    @cells[pos] != " "
  end

  def valid_move?(pos)
    i = to_index(pos)
    i >= 0 && i <= 8 && !taken?(i)
  end

  # private

  def taken?(i)
    space = to_index(i)

    @cells[space] != " "
  end

  def to_index(input)
    input.class == String ? (input.to_i - 1) : input
  end

  def position(input)
    i = to_index(input)
    @cells[i]
  end

end
