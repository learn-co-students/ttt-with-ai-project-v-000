require "pry"
class Board

  attr_accessor :cells
def initialize
@cells = [' ', ' ' ,' ',' ',' ',' ',' ',' ',' ']
end
def reset!
@cells = [' ', ' ' ,' ',' ',' ',' ',' ',' ',' ']
end
def display
  puts " " + cells[0] + " | " + cells[1] + " | " + cells[2] + " "
  puts "-----------"
  puts " " + cells[3] + " | " + cells[4] + " | " + cells[5] + " "
  puts "-----------"
  puts " " + cells[6] + " | " + cells[7] + " | " + cells[8] + " "
end

def position(n)
  index=n.to_i - 1
  @cells[index]
end

def full?
!@cells.include?(' ')
end

def turn_count
  count=0
  @cells.each do |element|
    if element!=' '
      count=count+1
    end
  end
  count
end

def taken?(n)
  index= n.to_i - 1
  if @cells[index] == ' '
     return false
  else
    return true
  end
end

  def valid_move?(n)
   if n.to_i >=1 && n.to_i <=9 && taken?(n)==false
      return true
    else
      return false
    end
  end

  def update(n, player)
    index = n.to_i-1
    cells[index]=player.token
  end
end
