class Board 
  
  attr_accessor :cells 
  
  def initialize 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input) 
    cell = input.to_i - 1
    @cells[cell]
  end 
  
  def full?
      if @cells[0] != " " && @cells[1] != " " && @cells[2] != " " && @cells[3] != " " && @cells[4] != " " && @cells[5] != " " && @cells[6] != " " && @cells[7] != " " && @cells[8] != " "
        return true 
      else 
        false 
      end
  end 
  
  def turn_count 
    x = 0
    @cells.each do |value|
      if value == " "
        x += 1 
      end
    end 
    9 - x 
  end 
   
  def taken?(input)
    if @cells[(input.to_i) - 1] != " "
      true 
    else 
      false 
    end 
  end 
  
  def valid_move?(input)
    x = input.to_i - 1
    if x < 0 || x > 8 
      return false
    end
    if @cells[x] == " "
      return true
    elsif @cells[x] == ""
      return true
    elsif @cells[x] == "X" || @cells[x] == "O"
      return false
    end  
  end 
  
  def update(input, competitor) 
    cell = input.to_i - 1
    if valid_move?(input) == true 
      @cells[cell] = competitor.token
    end 
  end 
end 