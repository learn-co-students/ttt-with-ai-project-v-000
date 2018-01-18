require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " ----------- "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " ----------- "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    if @cells.any? {|i| i == " "}
      return false
    else
      true
    end
  end

  def turn_count
    @cells.select {|i| i != " "}.size
  end

  def taken?(input)
    if @cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O"
      #binding.pry
       true
    else
      false
    end
  end

  def valid_move?(input)
    if !taken?(input.to_i) && (1..9) === input.to_i
      true
    else
      false
    end
  end

  def update(input, token)
    #binding.pry
    if turn_count.odd?
      token = "O"
    else
      token = "X"
    end
    @cells[input.to_i-1] = token
  end

end
