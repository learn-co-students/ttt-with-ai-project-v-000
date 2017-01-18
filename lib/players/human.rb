module Players
  class Human < Player
    def move(board)
      puts "Please enter move: (1-9)"
      pos = gets
    end
  end
end
