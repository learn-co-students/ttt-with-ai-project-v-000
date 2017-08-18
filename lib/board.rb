require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.all? {|cell| cell != " " && cell != nil}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    if input.to_i.between?(1,9)
      taken?(input) ? false : true
    end
  end

  def update(input, player)
    if valid_move?(input)
      index = input.to_i - 1
      @cells[index] = player.token
    end
  end

# binding.pry
end
