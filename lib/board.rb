require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    if @cells[0] == " " || @cells[1] == " " || @cells[2] == " " || @cells[3] == " " || @cells[4] == " " && @cells[5] == " " || @cells[6] == " " || @cells[7] == " " || @cells[8] == " "
      false
    else
      true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " " then counter += 1
      end
    end
    counter
  end

  # Another way to do #turn_count would be in a single line with the following code:
  # @cells.count{|cell| cell != ' '}

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    input = input.to_i
    if input.between?(1, 9) && taken?(input) != true
      true
    else
      false
    end
  end

  def update(position, player)
    position = position.to_i - 1
    @cells[position] = player.token
    @cells[position]
  end

end
