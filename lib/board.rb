class Board

attr_accessor :cells

def initialize
  @cells = cells
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def reset!
  cells.clear
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
  puts "-----------"
  puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
  puts "-----------"
  puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
end

def position(input)
  self.cells[input.to_i - 1]
end

def full?
  self.cells.all? {|space| space == "X" || space == "O"}
end

def turn_count
  turns = 0
self.cells.each do |position|
  if position == "X" || position == "O"
    turns +=1
  end
end
turns
end

def taken?(input)
  self.cells[input.to_i - 1] != " " && self.cells[input.to_i - 1] != ""
end

def valid_move?(input)
  (input.to_i - 1).between?(1,9) && !taken?(input)
end

end
