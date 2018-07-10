require 'pry'
class Board
  attr_accessor :cells

def reset!
  @cells = [" "," "," "," "," "," "," "," "," "]
end

  def initialize
    self.reset!
  end

  def display
    line_1 = (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
    line_2 = ("-----------")
    line_3 = (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
    line_4 = line_2
    line_5 = (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
    puts line_1, line_2, line_3, line_4, line_5
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    empty_spaces = []
    @cells.collect do |space|
      empty_spaces << space if space == " "
    end
    9 - empty_spaces.length
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    !taken?(input) && input.to_i > 0 && input.to_i < 10
  end

  def update(input, player)
    position(input) << player.token
    position(input).strip!
  end
end