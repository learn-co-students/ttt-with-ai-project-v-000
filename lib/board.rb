class Board

attr_accessor :cells


def initialize
  @cells = [" "," "," "," "," "," "," "," "," "]
end

def reset!
  self.cells = [" "," "," "," "," "," "," "," "," "]
end

def display
puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
puts "-----------"
puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
puts "-----------"
puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
end

def position(input)
  i = input.to_i - 1
  return self.cells[i]
end

def full?
self.cells.each do |number|
if number == nil or number == " "
return false
end
end
return true
end

def turn_count
  count = 0
  self.cells.each do |position|
    if position == "X"|| position == "O"
      count += 1
    end
  end
  return count
  end

  def taken?(input)
    index = input.to_i - 1
  !(self.cells[index].nil? || self.cells[index] == " ")
  end

  def valid_move?(input)
    index = input.to_i - 1
  if index <0 || index >8
  return false
  elsif
  (self.cells[index].nil? || self.cells[index] == " ")
  return true
  else return false
  end
  end

def update(input, player)
if valid_move?(input)
  index = input.to_i - 1
  self.cells[index] = player.token
end
end

end
