module Players
  class Human < Player

    def move(board)
      puts "Enter move: "
      input = gets.strip
    end
  end
end
