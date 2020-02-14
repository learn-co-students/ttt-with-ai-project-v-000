module Players

  class Human < Player
    def move(board)
      puts "What is your move? (1-9)"
      gets.strip
    end
  end

end
