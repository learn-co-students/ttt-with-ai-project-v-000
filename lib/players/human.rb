module Players
  class Human < Player

    def move(board)
      puts "Please enter your desired input."
      input = gets.strip
    end

  end
end
