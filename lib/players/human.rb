module Players

  class Human < Player
    def move(board)
      board.display
      puts " "
      puts "Player #{@token}, where would you like to make your move? Please enter a number 1-9."
      input = gets.strip
    end
  end

end
