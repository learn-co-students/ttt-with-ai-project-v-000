require "pry"
class Board
 
  
  attr_accessor :cells

  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def cells
    @cells.to_ary
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts " ----------- "
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts " ----------- "
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(index)
    @cells[index.to_i - 1]
  end
  
  def full?
    if @cells.include?(' ') || @cells.include?('')
      return false
   else
      return true
    end
  end
  
  def turn_count
    counter = 0
    @cells.each do |cell|
     if cell == "X" || cell == "O"
       counter +=1
      end
    end
    return counter
  end
  
  def taken?(input)
    if @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    if input.to_i >= 1 && input.to_i <= 9 && !taken?(input)
      true
    else
      false
    end
  end
  
  def update(input, player)
    if valid_move?(input)
       @cells[input.to_i - 1] = player.token
    end
  end
  
  def reset!
     @cells = Array.new(9, " ")
  end
  
end