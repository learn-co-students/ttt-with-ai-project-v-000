module Players
  class Human < Player

    def move(board)
      puts "Move? (1-9)" 
      gets.strip
    end
  end

end
