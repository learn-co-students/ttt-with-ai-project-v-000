require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    print " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
    print "-----------\n"
    print " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
    print "-----------\n"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.detect{|c| c == " "} == nil ? true : false
  end

  def turn_count
    @cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(input)
    @cells[input.to_i-1] == " " ? false : true
  end

  def valid_move?(input)
    taken?(input) == false && full? == false && input.to_i.between?(1,9) #? true : false
  end

  def update(input,player)
    @cells[input.to_i-1] = "#{player.token}"
  end

end
