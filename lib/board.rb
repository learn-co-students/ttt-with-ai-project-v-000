require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = self.reset!
  end

  def reset!
    @cells=Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    @cells.all? {|cell| cell=="X" or cell=="O"}
  end

  def turn_count
    @cells.count {|cell| cell=="X" || cell=="O"}
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def taken?(pos)
    @cells[pos.to_i-1]==" "? false : true
  end

  def valid_move?(pos)
    if pos.to_i.between?(1,9) && !taken?(pos.to_i)
      true
    else
      false
    end
  end

  def update(pos,player)
    @cells[pos.to_i-1]=player.token
  end

end
