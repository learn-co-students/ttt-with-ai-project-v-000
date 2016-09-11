class Board
attr_accessor :cells

def initialize
  reset!
end

def reset!
  @cells = Array.new(9, " ")
end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(input)
  @cells[input.to_i - 1]
end

def update(input, object)
  object = @cells[input.to_i - 1]
end

def token
end


def full?
  @cells.all? do |spaces|
  if  spaces == "X" || spaces == "O"
  true

  else
  false

  end
end
end


def taken?(input)
  !(@cells[input.to_i - 1].nil? || @cells[input.to_i - 1] == " ")
end

def valid_move?(input)
  (input.to_i - 1).between?(0,8) && !taken?(input.to_i)
end

def turn_count
   @cells.count{|token| token == "X" || token == "O"}
end

end
