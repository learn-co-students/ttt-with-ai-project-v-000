require 'pry'
class Board

attr_accessor :cells, :board, :token
#
#
 def reset!
   @cells = [" "," "," "," "," "," "," "," "," "]
 end

 def initialize
    self.reset!
  end

 def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

def position(users_input)
   index = users_input.to_i - 1
   @cells[index]
end

def full?
  @cells.none?{|i| i == " "}
end

def turn_count
  counter = 0
  @cells.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  counter
end

def taken?(index)
 position(index) == "X" ||  position(index) == "O"
end

def valid_move?(user_input)
  index = user_input.to_i - 1
  !taken?(user_input) && index.between?(0,8)
 end


def update(user_input, player)
  index = user_input.to_i - 1
  @cells[index] = player.token

end
end
