class Board
attr_accessor :cells
def initialize
  reset!
end

def reset!
  @cells = [" "," "," "," "," "," "," "," "," "]
end

def display

  puts  "-----------"
  puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} | "
  puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} | "
  puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} | "
end

def position(input)
  @cells[input.to_i-1]
end

def full?
  empties = []
  empties =  @cells.select{|cell| cell== " "}
  if empties.length > 0
    return false
  else
    return true
  end
end

def turn_count
  turns = @cells.select{|cell| cell != " "}
  turns.length
end

def taken?(cell)
  if position(cell)=="X" || position(cell)=="O"
    return true
  else
    return false
  end
end

def valid_move?(cell)
  if cell.length > 1
    false
  elsif cell =~ /[^0-9]/
    false
  elsif taken?(cell)
    return false
  else
    return true
  end
end

def update(cell, player)
  @cells[cell.to_i-1]=player.token
end

end
