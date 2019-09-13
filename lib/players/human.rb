module Players
  class Human < Player
    def move(board)
      puts "What space would you like? (1-9):"
      space = gets.strip
    end
  end
end
