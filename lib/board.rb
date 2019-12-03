require "pry"
class Board
  attr_accessor :cells, :board
  
  def reset!
    @cells = Array.new(9, " ") 
  end
  
  def initialize(board = nil)
    @cells = Array.new(9," ")
  end
  
  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    value = (input.to_i)-1
    cell = @cells[value]
    cell
  end
  
  def full?
    @cells.all? do |box|
      box == "X" || box == "O"
    end
  end
  
  def turn_count
    count = 0 
    @cells.each do |i|
      if i == "X" || i == "O"
       count += 1 
      end
    end
   return count  
  end
  
  def taken?(index)
    if position(index) == "X" || position(index) == "O"
      return true
    end
    if position(index) == " " || position(index) == ""
      return false
    end
  end
  
  def valid_move?(index)
    index = index.to_i
    if taken?(index) == false && index.between?(1, 9) == true
      return true
    else
      return false
    end
  end
  
  def update(index, player = "X")
    input = (index.to_i)-1
    @cells[input] = player.token
  end
    
end
