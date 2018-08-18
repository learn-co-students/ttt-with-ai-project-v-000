require 'pry'
class Board

  attr_accessor :cells

  @cells = ["", "", "", "", "", "", "", "", ""]

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    self.reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    position = input.to_i-1
    @cells[position]
  end

  def full?
      !@cells.include? (" ")
  end

  def turn_count
    cells.select{|x| x != " " }.length
  end

  def taken?(input)
    position = input.to_i-1
    # binding.pry
    if @cells[position].include? ("X")
      true
    elsif @cells[position].include? ("O")
      true
    else
      false
    end
  end

  def valid_move?(input) #Also needs to check if is taken
    position = input.to_i-1
    # binding.pry
    (0..8).include? (position)
  end

  def update(input, player)
    position = input.to_i-1
    @cells[position] << player

  end

end
