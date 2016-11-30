require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells =[]
    self.reset!
  end

  def reset!
    @cells.clear
    9.times {@cells << " "}
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    @cells[index.to_i-1]
  end

  def update(index, player)
    if valid_move?(index.to_i)
      @cells[index.to_i-1] = player.token
      return true
    end
    return false
  end

  # def token
  # end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.select {|space| space == "X" || space == "O"}.count
  end

  def taken?(index)
    (position(index.to_i) == "X" || position(index.to_i) == "O")
  end

  def valid_move?(index)
    (!taken?(index.to_i) && index.to_i.between?(1,9)) ? true : false
  end

end
