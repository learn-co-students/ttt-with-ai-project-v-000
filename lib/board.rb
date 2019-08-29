class Board

  attr_accessor :cells


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

  if input.to_i.between?(1,9) == true && taken?(input) == false
    true
  else
    false
  end
end

def update(input, player)
@cells[input.to_i-1] = player.token
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
