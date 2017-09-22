module Players
  class Human < Player

    def move(board)
      puts "In which position (#1-9) would you like to place your token?"
      input = gets.strip
      input
    end
  end
end
