require 'pry'
class Board

  attr_accessor :name, :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} ""|"" #{cells[1]} ""|"" #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} ""|"" #{cells[4]} ""|"" #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} ""|"" #{cells[7]} ""|"" #{cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    if self.cells.detect { |cell| cell == " " }
      false
    else
      true
    end
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def taken?(num)
    num = num.to_i
    if self.cells[num - 1] != " "
      true
    else
      false
    end
  end

  def valid_move?(num)
    num = num.to_i
    if num >= 1 && num <= 9 && self.taken?(num) == false
      true
    else
      false
    end
  end

  def update(num, player)
    num = num.to_i - 1
    cells[num] = player.token
  end
end
