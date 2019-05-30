class Players
  class Human < Player
    def move(input)
      puts "Please enter a move"
      input = gets.strip
      input
    end
  end
end
