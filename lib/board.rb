class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    return @cells[pos.to_i - 1]
  end

  def full?
    return !@cells.include?(" ")
  end

  def turn_count
    return @cells.select {|entry| entry == "X" || entry == "O"}.size
  end

  def taken?(pos)
    return ["X","O"].include?(position(pos))
  end

  def valid_move?(pos)
    return (1..9).to_a.include?(pos.to_i) && position(pos) == " "
  end

  def update(position, player)
    if valid_move?(position)
      @cells[position.to_i-1] = player.token
    end
  end





end