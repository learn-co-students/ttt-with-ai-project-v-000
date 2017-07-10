module Players
  class Human < Player
    def move(board)
      puts "Enter a number from 1-9"#returns the value the user enters
      gets.strip
    end
  end
end
