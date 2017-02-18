module Players
  class Human < Player
    def move(board)
      puts "Please choose a position, or enter 'quit' or 'q' to quit: "
      input = gets.strip
      if input == "quit" || input == "q"
        exit
      else
      	input
      end
    end
  end
end
