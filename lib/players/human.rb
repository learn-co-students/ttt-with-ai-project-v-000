module Players
  class Human < Player

    def move(board) #needs to know where the move goes
      puts "Please make a move by pressing 1-9 for the space you want:"
      gets.strip
    end
  end
end
