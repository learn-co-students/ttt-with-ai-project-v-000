module Players
  class Human < Player

    def move(board)
      puts "Pick a position (#1-9) to place your token?"
      input = gets.strip
      input
    end
  end
end
