module Players
  class Human < Player

    def move(board)
      puts "Please enter a valid move for positions 1-9:"
      cell = gets.strip
    end



  end
end
