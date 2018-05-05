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
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "------------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-------------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end


def position(input)
  input = input.to_i-1
  @cells[input]
end

def full?
  if @cells.include?(" ")
    false
  else
    true
  end
end


def turn_count
  counter = 0
  @cells.each do |cell|
    if cell == "X" || cell == "O"
      counter += 1
    end
  end
    counter
  end

  def taken?(input)
    input = input.to_i - 1
    @cells[input] == "X" || @cells[input] == "O"
  end

def valid_move?(input)
fixed_input = input.to_i - 1
taken?(input) == false  && fixed_input.between?(0, 8)

end

def update(position, player)
  fixed_input = position.to_i - 1
  if turn_count.even?
    player = "X"
  else
    player = "O"
  end 
  if valid_move?(position)
  @cells[fixed_input] = player
end
end



end
