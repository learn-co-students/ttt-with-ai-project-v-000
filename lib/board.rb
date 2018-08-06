class Board 
  attr_accessor :cells, :board
  
  def initialize 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset!
    @cells.clear
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
    cells[input.to_i-1]
  end 
  
  def full?
      @cells.all?{|position| position == "X" || position == "O"}
  end

  def turn_count
    x = @cells.count("X") 
    o = @cells.count("O")
    x + o
  end 

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end 
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  
  def update(input, character = "X") 
      if input.to_i.odd?
        character = "X" 
      else 
        character = "O"
      end
      @cells[input.to_i-1] = character
  end
end 

