module Players
  class Human < Player
    def move(board)
      puts "Please enter your play (1-9)"
      input = gets.strip
    end
  end
end
