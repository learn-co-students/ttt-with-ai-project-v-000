class Board 
  attr_accessor :cells
  def reset! 
    @cells = Array.new(9, " ") 
  end  
  
  def initialize
    @cells = Array.new(9, " ")
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(num)
    @cells[num.to_i - 1]
  end
  
  def full? 
    @cells.none? {|c| c == " "}
  end
  
  def turn_count 
    count = @cells.select { |c| c != " "}
    count.size
  end
  
  def taken?(num)
    @cells[num.to_i - 1] != " "
  end 
  
  def valid_move?(num)
    !taken?(num) && (1..9) === num.to_i
  end
  
  def update(num, player)
    @cells.fi
    @cells[num.to_i - 1]   
  end
end 

# learn --fail-fast