# module Players
#   class Human < Player
#     def move(input)
#       puts "Please enter a move between 1-9:"
#       user_input = gets.strip
#     end
#   end
# end
class Player::Human < Player
  def move(board, timer)
    puts "Please enter 1-9:"
    gets.chomp
  end
end
