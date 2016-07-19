module Players

class Human < Player

attr_accessor :move

def move(move)
  puts "Where would you like to move?"
  input = gets.chomp
end

end

end
