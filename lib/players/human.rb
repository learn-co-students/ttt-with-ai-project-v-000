# Players Class
class Players
  # Human Player Class < Player Class
  class Human < Player
    def move(board)
      puts 'Please enter a number between 1 - 9:'
      gets.strip
    end
  end
end
