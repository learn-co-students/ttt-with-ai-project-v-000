require 'pry'

module Players

class Human < Player

def move(board)
  #binding.pry
  puts "Please enter 1-9:"
  gets.chomp
end

end
end
