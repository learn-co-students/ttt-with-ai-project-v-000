require 'pry'
class Board
  def initialize
    
    @cells = Array.new(9, " ")
  end

  def cells=(cells)
    @cells = cells
  end

  def cells
    @cells
  end
  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    num = input.to_i
    self.cells[num - 1]
  end

  def full?
    if self.cells.detect {|c| c == " "}
      false
    else true
    end
  end

  def turn_count
    count = 0
    self.cells.each do |c| 
      if c == "X" || c == "O"
        count = count + 1
      end
    end
    count
  end

  def taken?(position)
    if self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] =="O"
      true
    else false
    end
  end

  def valid_move?(position)
    p = position.to_i
    if (p >= 1 && p <=9) && !self.taken?(position)
      true
      else false
    end 
  end

  def update(position, player)
    if self.valid_move?(position)
      self.cells[position.to_i - 1] = player.token
    end
  end


end