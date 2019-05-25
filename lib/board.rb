require 'pry'

class Board
  attr_accessor :cells

  @cells = []

  def initialize
    @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end


  def cells
    @cells
  end

  def reset!
    @cells.clear
    @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
      input = input.to_i - 1
      # binding.pry
        if @cells[input] == "O"
          # binding.pry
          return "O"
        elsif @cells[input] == "X"
          return "X"
        elsif @cells[input] == " "
          return " "
          # binding.pry
        end
  end

  def full?
    # binding.pry
    self.cells.all?{ |cell| cell != " "}
    # binding.pry
  end

  def turn_count
    array = self.cells.select{ |cell| cell != " "}
    array.count
  end

  def taken?(position)
    position = position.to_i - 1

    # !self.cells[position] == " " && (self.cells[position] != "X" || self.cells[position] != "O")

    if self.cells[position] == " "
      false
    elsif self.cells[position] == "X" || self.cells[position] == "O"
      true
    end
  end
#
  def valid_move?(move)
    # binding.pry
    move.to_i.between?(1,9) && !taken?(move)
      # binding.pry
    # if move.to_i.between?(1,9) && taken?(move) == false
    #   # binding.pry
    #   true
    # else
    #   false
    # end
  end

  def update(position, player)
    position =  position.to_i - 1
    # binding.pry
    self.cells[position] = player.token
    # binding.pry
  end


end
