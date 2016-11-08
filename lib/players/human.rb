
module Players
  class Human < Player
    def move(board)
      puts "Enter a space number (1-9) to make your move: "
      input = gets.strip
      input
    end
  end
end
