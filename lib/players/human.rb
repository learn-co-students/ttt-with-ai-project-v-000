module Players
  class Human < Player

    def move(board)
       puts "Please enter your selection."
       input = gets.strip
       return input
    end
  end
end
