require 'pry'
class Board
  attr_accessor :cells, :token



  def reset!
   @cells = Array.new(9, " ")
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
cells[input.to_i - 1]
end

def full?
cells.all? {|token| token == "X" || token == "O"}
end

def turn_count
turns = cells.count {|token| token == "X" || token == "O"}
end

def taken?(input)
!(position(input) == " " || position(input) == "")
end

def valid_move?(input)
position = input.to_i - 1
position.between?(0,9) && !taken?(input)
end

def update(input, player)
cells[input.to_i - 1] = player.token
end





end
