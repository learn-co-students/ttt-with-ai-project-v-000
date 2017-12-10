module Players

class Human < Player

def move(input)
  puts "Where do you want to go?"
  input = gets.chomp
end

end
end
