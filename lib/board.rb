require 'pry'
class Board
  
  BLANK_CELLS = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  #Had a very strange error where it seemed that my BLANK_CELLS 'constant'
  #was being changed underneath me resulting in a failed test.  Setting to this 
  #array literal solved it
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]#BLANK_CELLS
  end
  
  def display
    puts
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"    
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end
  
  #takes in user input and returns the value of the board cell
  #Cells (positions) are named "1" - "9".  The array is indexed by ints 0-8 
  def position(pos)
    @cells[to_index(pos)]
  end
  
  def full?
    !@cells.any? { |c| c == " " }
  end
  
  def turn_count
    @cells.find_all { |c| c == "X" || c == "O" }.size
  end
    
  def taken?(pos)
    self.position(pos) == "X" || self.position(pos) == "O"
  end
  
  def valid_move?(pos)
    valid_pos?(pos) ? !self.taken?(pos) : false
  end
  
  def update(pos, player)
    @cells[to_index(pos)] = player.token
  end
  
  def all_x?(indexes)
    indexes.all? { |i| @cells[i] == "X" }
  end
  
  def all_o?(indexes)
    indexes.all? { |i| @cells[i] == "O" }
  end
  
  def all_taken?
    @cells.all? { |cell| cell == 'X' || cell == 'O' }
  end
  
  private
  
  def to_index(pos)
    pos.to_i - 1
  end
  
  def valid_pos?(pos)
    ["1", "2", "3", "4", "5", "6", "7", "8","9"].include?(pos)
  end
 
end
