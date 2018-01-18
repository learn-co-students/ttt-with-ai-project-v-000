require 'pry'

class Board
  attr_accessor :cells

  def initialize(cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    @cells = cells
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def position(cell_pos)
    @cells[cell_pos.to_i - 1]
  end

  def full?
    full_array = @cells.select {| elem | elem == " " || elem == "" or elem == nil}
    if full_array.length > 0
      return false
    else
      return true
    end
  end

  def turn_count
    count = 0
    @cells.each {| elem | elem == "X" || elem == "O" ? count += 1 : count = count}
    count
  end

  def taken?(val)
    if @cells[val.to_i - 1] != " " && @cells[val.to_i - 1] != "" && @cells[val.to_i - 1] != nil
      true
    else
      false
    end
  end

  def valid_move?(val)
    if taken?(val) || !val.to_i.between?(1, 9)
      false
    else
      true
    end
  end

  def update(ind, player)
    @cells[ind.to_i - 1] = player.token
  end

end
