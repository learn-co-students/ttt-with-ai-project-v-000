require "pry"

class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" ", " ", " ",
                  " ", " ", " ",
                  " ", " ", " "]
  end

  def display
    separater = "-----------"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts separater
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts separater
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "


  end

  # def row(row_number)
  #   case row_number
  #
  #   when 1
  #
  #   when 2
  #   when 3
  #   end
  # end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.none? { |cell| cell == " " }
  end

  def turn_count
    self.cells.count { |cell| cell != " " }
  end

  def taken?(position)
    position(position) != " "
  end

  def valid_move?(input)
    (input.to_i >= 1 && input.to_i <= 9 && !taken?(input)) ? true : false
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
    display
  end

end
