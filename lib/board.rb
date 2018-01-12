class Board
  attr_accessor :cells
  def initialize
    self.reset!
  end
  
  def reset! 
    self.cells = [" "," "," "," "," "," "," "," "," "]

  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(input)
    self.cells[input.strip.to_i - 1]
  end
  
  def full?
   self.cells.none? {|s| s == " "}
 end
 
 def turn_count
   counter = 0
   self.cells.each do |cell|
     if cell == "X" || cell == "O"
       counter += 1 
     end
   end
   counter
 end
 
 def taken?(input)
   self.cells[input.strip.to_i-1] != " "
 end
 
 def valid_move?(input)
  input.strip.to_i > 0 && input.strip.to_i < 10 && !self.taken?(input)
  end
  
  def update(input, player)
    self.cells[input.strip.to_i - 1] = player 
  end
end