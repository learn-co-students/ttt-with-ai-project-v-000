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
    if @cells[pos.to_i - 1] == "X" || @cells[pos.to_i - 1] == "O" # - 1
      return true
    else 
      return false 
    end
  end
  
  def valid_move?(pos)
    #false if pos > 9 || pos < 1 else true
    if pos.to_i < 10 && pos.to_i > 0 && self.taken?(pos) == false
      return true
    else
      return false
    end
  end
  
  def update(pos, player)
    #binding.pry
    @cells[pos.to_i - 1] = player.token
  end
end