
  class Player::Human < Player

    def move(board)
      puts "Please enter a number between 1-9:"
      input = gets.strip
      return input
    end

  end
