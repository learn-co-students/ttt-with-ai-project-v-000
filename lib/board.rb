require 'pry'

class Board 
  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " "
    puts " "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
    puts " "
  end


  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  def position(position)
    @cells[position.to_i - 1]
  end

  def taken?(position)
    !(@cells[position.to_i - 1].nil? || @cells[position.to_i - 1] == " ")
  end

  def valid_move?(position)
    if (taken?(position.to_i) == false) && (position.to_i.between?(1,9) == true)
    true
    else (taken?(position.to_i) == true) || (position.to_i.between?(1,9) == false)
    false
    end
  end

  def full?
    @cells.all? { |i| i == "X" || i == "O" }
  end

  def turn_count
    @cells.count{ |i| i == "X" || i == "O"}
  end

end