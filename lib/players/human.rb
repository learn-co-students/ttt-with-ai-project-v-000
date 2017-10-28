module Players
  class Human < Player
    Players::Human
    def move(board)
      puts "Please enter a number from 1..9"
      move = gets.strip

  end
end
end
