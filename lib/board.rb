class Board
  attr_accessor :cells

def initialize
  reset!
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

def position(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
  @cells[user_input]
end

def full?
  all_board = @cells.all? do |space|
    space == "X" || space == "O"
  end
  all_board
end

def turn_count
  counter = 0
      @cells.each do |square|
        if square == "X" || square == "O"
          counter += 1
        end
      end
      counter
end

def taken?(index)
    if @cells[index.to_i - 1] == " "
     false
   elsif @cells[index.to_i - 1] == ""
      false
    elsif @cells[index.to_i - 1] == nil
      false
    else
      true
    end
end

def valid_move?(index)
  index = index.to_i
  if index.between?(1,9) == true && taken?(index) == false
    true
  else
    false
  end
end

def update(user_input, player)
  user_input = user_input.to_i
  user_input = user_input - 1
  @cells[user_input] = player.token
end



end
