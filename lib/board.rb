class Board
    attr_accessor :cells
  
  def initialize
    @cells = [' ', ' ', ' ', ' ', ' ', ' ',' ', ' ',' ']
  end
  
  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ',' ', ' ',' ']
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}  \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]}  \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(user_input)
    pos = user_input.to_i 
    pos -= 1
    @cells[pos]
  end  
  
  def full?
    # binding.pry
    if @cells.find { |i| i == ' '}
      false
    else
      true
    end 
  end  
  
  def turn_count
    count = 0
    @cells.each do |cell|
    if cell == 'X' || cell == 'O'
      count+=1 
    end
  end
    count
  end
end