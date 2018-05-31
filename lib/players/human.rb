module Players
  class Human < Player

    def move(board)
      puts "Please make your selection."
      gets.strip
    end
  end
  
end
