module Players
  class Human < Player
    def move (board)
      puts "#{token} is your turn. Please enter a number 1-9:"
      gets.strip
    end
  end
end
