class Board
  
  attr_accessor :cells
  
  def reset! 
    @cells = Array.new(9," ")
  end
  
  def initialize
     reset!
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    # input is a string & is 1-9
    @cells[input.to_i-1]
  end
  
  def full?
    @cells.none? {|cell| cell == " "}
  end
  
  def turn_count
    # ary.count{|x|x%2==0} 
    @cells.count{|cell| cell == "X" || cell == "O"}
  end
  
  def taken?(input)
     # input is a string & is 1-9 
     position(input) == "X" || position(input) == "O" 
  end
  
  def valid_move?(input)
    # input is a string & is 1-9
    !taken?(input) && input.to_i.between?(1,9)
  end
  
  def update(input, player)
    # input 1-9   array accepts 0-8
    @cells[input.to_i - 1] = player.token
  end
  
  
  
  
  
  
end