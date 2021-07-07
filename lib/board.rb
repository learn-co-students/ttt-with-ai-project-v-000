class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def display
    puts "\n #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end
  
  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end
  
  def position(i)
    @cells[i.to_i-1]
  end
  
  def full?
    @cells.all?{|i| i ==  "X" || i == "O"}
  end
  
  def turn_count
    @cells.select{|i| i ==  "X" || i == "O"}.count
  end
  
  def taken?(i)
    @cells[i.to_i-1] == "X" || @cells[i.to_i-1] == "O"
  end
  
  def valid_move?(i)
    i.to_i.between?(1,9) && !self.taken?(i)
  end
  
  def update(i, player)
    @cells[i.to_i-1] = player.token
  end
end