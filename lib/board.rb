class Board

  attr_accessor :cells

def initialize (cells = nil)
  @cells = cells || Array.new(9, " ")
end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def reset!
  self.cells = Array.new(9, " ")
end

def position(index)
  cell = input_to_index(index)
  self.cells[cell]
end

def input_to_index(input)
  index = input.to_i - 1
end

def full?
   self.cells.none? {|cell| cell.lstrip.empty?}
end

def turn_count
  self.cells.select{|c| !c.lstrip.empty?}.count
end

def taken?(input)
  if self.position(input) == " "
         false
       else
         true
       end
end

def valid_move?(input)
  !taken?(input) && (1..9).member?(input.to_i)
end

def update(input, player)
   self.cells[input.to_i - 1] = player.token
end

def reset!
     self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

end
