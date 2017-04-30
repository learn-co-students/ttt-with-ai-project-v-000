#####inherits from Player
#####move
#asks the user for input and returns it

module Players
  class Human < Player
    def move (board)
      puts "#{token} is your turn. Please enter a number 1-9:"
      user_input=gets.strip
    end
  end
end
