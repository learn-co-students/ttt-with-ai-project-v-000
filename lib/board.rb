require 'pry'
class Board

attr_accessor :cells

@cells = []

def initialize
  @cells = [" "," "," "," "," "," "," "," "," "]
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

def display_computer
  puts
  puts "The computer's move is:"
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  puts
end

def display_intro
  puts
  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "
  puts
end

def reset!
  @cells = [" "," "," "," "," "," "," "," "," "]
end

def position(number)
  @cells[number.to_i - 1]
end

def full?
  @cells.include?(" ") ? false : true
end

def turn_count
  turns = 0
  @cells.each do |x|
    turns+=1 if x != " "
    end
    turns
  end

def taken?(number)
  @cells[number.to_i - 1] == " " ? false : true
end

def valid_move?(number)
  if full? == false && taken?(number) == false && number.to_i.between?(1,9)
    return true
  else
    return false
  end
end

def update(cell,player)
  @cells[cell.to_i - 1] = player.token
end


end
