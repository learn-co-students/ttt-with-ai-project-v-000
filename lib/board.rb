require "pry"
class Board 
  
  attr_accessor :cells

  
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

def reset!
  @cells = Array.new(9, " ")
end

def position(input)
 @cells[input.to_i - 1] 
end

def full?
  @cells.all? do |full|
    full == "X" || full == "O"
  end
end

def turn_count
  counter = 0
  @cells.each do |board_var|
    if board_var == "X" || board_var == "O"
    counter += 1
  end
  end
  counter
end

def taken?(index)
    if position(index) == "X" || position(index) == "O"
    true
    elsif position(index) == " " 
    false
 end
end

def valid_move?(index)
  if index.to_i - 1 < 0  || index.to_i - 1 > 8
    return false
  elsif position(index) == "X" || position(index) == "O"
    return false
  else
    true
  end
end

# for valid_move this also works --> input.to_i.between?(1,9) && !taken?(input)

def update(user_position, player)
  
  @cells[position(user_position) ] = player.token
end


end