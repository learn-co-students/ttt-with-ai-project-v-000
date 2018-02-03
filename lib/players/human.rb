module Players
  class Human < Player

    def move(board)
      puts "Where would you like to play (1-9)?"
      input = gets.strip
      input
    end


  end
end
