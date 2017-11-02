require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
    reset!
  end

  def reset!
    cells.clear
     cells << [" ", " ", " ", " ", " ", " ", " ", " ", " "]
     cells.flatten!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}  "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}  "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}  "
  end

  def full?
    cells.all? {|token| token == "X" || token == "O"}
end

  def input_to_index(input)
     input = input.to_i - 1
  end

  def position(input)
    cells[input.to_i-1]
  end

  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && position(input) == " "
      true
    end
  end


  def taken?(input)
  position(input) == "X" || position(input) == "O"
  end


  def update(input, player)

    cells[input.to_i - 1] = player.token
    display

  end
end
