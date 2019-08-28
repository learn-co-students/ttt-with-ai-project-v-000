class Board

  attr_accessor :cells

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #lower row
  [0,4,8], #horizontal row_a
  [2,4,6], #horizontal_row_b
  [1,4,7], #vertical_row_a
  [0,3,6], #vertical_row_b
  [2,5,8], #vertical_row_c
  ]

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
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
index = input.to_i-1
@cells[index]
end


def taken?(input)
  if position(input) == "" || position(input) == " " || position(input) == nil
    false
  elsif position(input) == "X" || position(input) == "O"
    true
  end
end

def valid_move?(input)

  if input.to_i.between?(0,9) && taken?(input) == false
    true
  else
    false
  end
end

def update(input)
  index = input.to_i-1
if valid_move?(input)
  position(input)
  display_board
end
end
  # def move(index, value)
  #    @board[index] = value
  #   return value
  # end
  # def turn
  # puts "Please enter 1-9:"
  #   position_taken = gets.strip
  #   index = input_to_index(position_taken)
  #   if !valid_move?(index)
  #     turn
  #   else
  #     move(index, current_player)
  #    display_board
  #   end
  # end


def full?
 if @cells.include?(' ') || @cells.include?('')
   return false
else
   return true
 end
end


def turn_count
  counter = 0
  @cells.each do |place|
    if place == 'X' || place == 'O'
    counter += 1
  end
  end
  return counter
end



end
