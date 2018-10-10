class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  
  def full?
    if @cells.none? { |n| n == "" || n == " " }
      true
    elsif @cells.any? { |n| n == "" || n == " " }
      false
    end
  end
  
  def turn_count
    array = @cells.delete_if { |n| n == "" || n == " " }
    array.length
  end
  
  def taken?(position)
    if @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
      return true
    else return false
    end
  end
  
  def valid_move?(position)
    if self.taken?(position) == false && (1..9).include?(position.to_i)
      return true
    elsif self.taken?(position) == true || !(1..9).include?(position.to_i) 
      return false
    end
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
end


