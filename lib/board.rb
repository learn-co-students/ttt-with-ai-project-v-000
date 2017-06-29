require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display #Displays empty board
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    number = num.to_i
    position = number -=1
    "#{@cells[position]}"
  end

  def full?
    @cells.each do |space|
      if space != "X" && space != "O"
        return false
      else
        true
      end
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(index)
    !taken?(index) && index.to_i.between?(1,9)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end
end
