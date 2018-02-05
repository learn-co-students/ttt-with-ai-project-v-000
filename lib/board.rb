require 'pry'
class Board
#checking git 
  attr_accessor :cells

  @cells = []

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
    puts "-----------"
    puts (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
    puts "-----------"
    puts (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    #binding.pry
    @cells.all?{|a| a == "X" || a == "O"} #calling .all? on @cells and see if all 9 indexes in the array are either occupied by "X" or "O"... If all indexes are taken by either of these two strings, the method will return true.
  end

  def turn_count
    @cells.count{|a| a == "X" || a == "O"}
  end

  def taken?(input)
    #binding.pry
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end


end
