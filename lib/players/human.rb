module Players
  class Human < Player
    def move(board)
      puts "Where you want to play foo'? (1-9)"
      input = gets.strip
    end
  end
end
