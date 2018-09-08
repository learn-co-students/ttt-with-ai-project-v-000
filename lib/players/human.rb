module Players
class Human < Player

def move(board)
  puts "Please enter your move"
  turn = gets.chomp
  return turn 
end 
end 
end 