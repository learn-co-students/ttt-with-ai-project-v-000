class Board
  attr_accessor :cells
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(location)
    @cells[location.to_i - 1]
  end
  
  def full?
    if @cells.detect{|i| i == " "} == nil
      return true
    else
      return false
    end
  end
  
  def turn_count
    @cells.count{|i| i != " "}
  end
  
  def taken?(pos)
    if @cells[pos.to_i - 1] != " "
      return true
    else 
      return false 
    end
  end
end