module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9: "
      user_input = gets.strip
    end
  end
end
