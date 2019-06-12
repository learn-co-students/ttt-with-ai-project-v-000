require 'pry'
class Board

attr_accessor :cells

def initialize
reset!
end



def reset!
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(move)
  cells[move.to_i - 1]
end

def full?
  if !cells.include?(" ")
    true
  end
end

def turn_count
count = 0
cells.collect do |turn|
  if turn.include?("X")
    count += 1
  elsif turn.include?("O")
    count += 1
  end
end
  count
end

def taken?(move)
    if cells[move.to_i - 1] == "X" || cells[move.to_i - 1] == "O"
      true
    elsif cells[move.to_i - 1] == " "
      false
    end
  end

  def valid_move?(move)
    !taken?(move) && move.to_i.between?(1,9)
  end

  def update(move,player)
    cells[move.to_i - 1] = player.token
  end

end
