require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    index = @cells[index.to_i - 1]
  end

  def full?
    @cells.all? { |position| position == "X" || position == "O" }
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
    #binding.pry
  end

  def taken?(position)
    position = position.to_i - 1
    if @cells[position] == " " || @cells[position] == "" || @cells[position] == nil
      false
    elsif @cells[position] == "X" || @cells[position] == "O"
      true
    end
  end

  def valid_move?(position)
    if taken?(position) == false && (position.to_i).between?(1, 9) == true
      true
    elsif taken?(position) == true || (position.to_i).between?(1, 9) == false
      false
    end
  end

  def update(input, token)
    if turn_count.odd?
      token = "O"
    else
      token = "X"
    end
    @cells[input.to_i-1] = token
  end

  def cell_value(index)
    cells[index]
  end

end
