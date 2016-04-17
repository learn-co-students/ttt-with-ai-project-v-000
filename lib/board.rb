require 'pry'
class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9," ")
  end

  def display
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""

  end

  def position(pos)
     @cells[pos.to_i-1]
  end

  def full?
    @cells.all? {|array| array == "X" || array == "O" }
  end

  def turn_count
    @cells.grep(/(X|O)/).count
  end

  def taken?(pos)
    (@cells[pos.to_i-1] == "X" || @cells[pos.to_i-1] == "O") ? true : false
  end

  def valid_move?(pos)
    if pos.to_i.between?(1,9)
      !taken?(pos) ? true : false
    end
  end

  def update(pos, player)
    if valid_move?(pos)
      @cells[pos.to_i-1]= player.token
    end

  end

end
