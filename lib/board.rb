class Board

def initialize
  reset!
end

def reset!
  @cells = Array.new(9, " ")
end

def display
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def position(input)
  @cells[index.to_i]
end

end
