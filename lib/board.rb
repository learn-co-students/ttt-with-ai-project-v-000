class Board
attr_accessor :cells
def initialize
  self.cells = Array.new(9, " ")
end
def reset!
  self.cells = Array.new(9, " ")
end
def display
  puts "*********************************"
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  puts "*********************************"
end
def position(input)
  self.cells[input.to_i-1]
end
def full?
  self.cells.all? {|e|
    e =="X" || e =="O"
  }
end
def turn_count
  sum = 0
  self.cells.each {|e|
    sum+=1 if e =="X" || e =="O"
  }
  sum
end
def taken?(position)
  self.cells[position.to_i-1]!= " "
end
def valid_move?(position)
  position.to_i>0 && position.to_i<10 && !self.taken?(position)
end
def update(position, player)
  self.cells[position.to_i-1]=player.token
end
end
