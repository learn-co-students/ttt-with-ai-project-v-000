require 'pry'
class Board
attr_accessor :cells

def initialize
  @cells = Array.new(9," ")
end

def reset!
  @cells = Array.new(9," ")
end

def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(input)
  input = input.to_i
  if input.between?(1,9)
    cells[input-1]
  end
end

def full?
 cells.all? {|x| x == "O" || x == "X"}
end

def turn_count
  turns = 0
  cells.each {|x|turns += 1 if x == "O" || x == "X"}
  turns
end

def taken?(index)
position(index) == "X" || position(index) == "O"
end

def valid_move?(input)
  input = input.to_i
  !taken?(input) && input.between?(1,9)
end

def update(input, player)
  input = input.to_i
  cells[input-1] = player.token
end






















end
