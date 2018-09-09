module Players
class Human < Player
   def move(board)
    puts "Player '#{token}', please enter a valid move"
    puts "Current valid moves are #{board.current_valid_moves}"
    input = gets.strip
    puts "You chose #{input}"
    input
      end
    end
 end