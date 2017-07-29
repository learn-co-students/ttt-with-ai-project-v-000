module Players
  class Human < Player

    def move(board)
      token = self.token
      puts "#{token}'s turn! Please enter 1-9:"
      input = gets.strip
    end
  end
end
