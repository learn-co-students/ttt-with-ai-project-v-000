class Board
  attr_accessor :cells, :token

  @@cells = []

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

def display
  puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
  puts "-----------"
  puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
  puts "-----------"
  puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
end

def position(input)
input = input.to_i
input = input - 1
  self.cells[input]
end

def full?
  if self.cells.include?(" ") then false
  else
    true
  end
end

def turn_count
  self.cells.count - self.cells.count(" ")
end

def taken?(input)
(self.position(input) == "X" || self.position(input) == "O") ? true : false
end

def valid_move?(input)
  if self.position(input) == " " && input.to_i.between?(1,9) then true
  else
    false
  end
end


def update(input, player)
  self.cells[input.to_i - 1] = player.token
  self.cells
end

end
