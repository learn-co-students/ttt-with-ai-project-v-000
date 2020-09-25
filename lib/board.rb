class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells [input.to_i-1]
  end

def update(input, player)
  input = input.to_i-1
  @cells[input] = player.token
end

def full?
 !@cells.include?(" ")
end

def turn_count
  @cells.count {|x| x != " "}
end

def taken?(input)
    position(input) != " "
end

def valid_move?(input)
  input = input.to_i-1

  if input < 0 || input > 8
    false
  elsif @cells[input] == " "
    true
  else
    false
  end
end
end
