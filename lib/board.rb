class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    cells.clear
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(move)
    @cells[move.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    count = 0
    cells.each {|c| count += 1 if c != " "}
    count
  end

  def taken?(move)
     @cells[move.to_i - 1] != " "
  end

  def valid_move?(move)
     !taken?(move) && (1..9).include?(move.to_i)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
