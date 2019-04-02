require 'pry'
class Board 
  attr_accessor :cells 

  def initialize
    reset!
  end 

  def cells
    @cells  
  end 

  def reset!
  @cells =Array.new(9, " ")

  end 

  def display
  base_num = 0
    3.times do 
      puts " #{@cells[base_num]} | #{@cells[base_num+1]} | #{@cells[base_num+2]} \n"
      puts "-----------\n" if base_num < 6
      base_num += 3
    end 
  end 

  def position(string)
   return @cells[(string.to_i - 1)]
  end 

  def full?
    !@cells.include?(' ')
  end 

  def turn_count
  @cells.count{|x| x != ' '}
  end 

  def taken?(string)
  self.position(string) != ' '
  end 

  def valid_move?(string)
    !(string.to_i > 10 || self.taken?(string) || string.length > 1)
  end 

  def update(pos,pla) 
    if self.valid_move?(pos)
      @cells[(pos.to_i-1)] = pla.token
    end 
  end 

end 