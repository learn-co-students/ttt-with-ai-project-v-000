require 'pry'
class Board
 attr_accessor :cells

 def reset!
   @cells.clear
   @cells = Array.new(9, " ")
 end

 def initialize
   @cells = Array.new(9, " ")
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
  @cells.all? {|cell| cell == "X" || cell == "O"}
end

def turn_count
  count = 0
  cells.each do |cell|
    if cell == "X" || cell == "O"
      count += 1
    end
  end
  count
end

def taken?(input)
  !(position(input) == " " || position(input) == "")
end

def valid_move?(input)
  i = input.to_i
  i.between?(1, 9) && !taken?(i)
end

def update(input, player)
  cells[input.to_i - 1] = player.token
end

end
