class Board

attr_accessor :cells

def initialize
  self.reset!
  self.display
  # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

def position(input)
  index = input.to_i - 1
  @cells[index]
end

def full?
  @cells.all? {|c| c != " "}
end

def turn_count
    @cells.count {|c| c == "X" || c == "O"}
end

def taken?(input)
  self.position(input) != " "
end

def valid_move?(input)
  input.to_i.between?(1,9) && !taken?(input)
end

def update(position, character = "X")
  index = position.to_i - 1
  if valid_move?(position)
    @cells[index] = character.token
  end
end

end
