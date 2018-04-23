require 'pry'
class Board
  attr_accessor :cells
  attr_reader   :player
  # def cells
  #   []
  # end

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0].upcase} | #{@cells[1].upcase} | #{@cells[2].upcase} "
    puts "-----------"
    puts " #{@cells[3].upcase} | #{@cells[4].upcase} | #{@cells[5].upcase} "
    puts "-----------"
    puts " #{@cells[6].upcase} | #{@cells[7].upcase} | #{@cells[8].upcase} "

  end

  def position(pos)
    @cells[pos.to_i - 1]
  end


  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(pos)
    position(pos) == " " ? false : true
  end

  def valid_move?(pos)
    taken?(pos) || pos.to_i < 1 || pos.to_i > 9  ? false : true
  end

  def update(pos, player)

    if valid_move?(pos)
      @cells[pos.to_i - 1] = player.token
    end

  end

end
