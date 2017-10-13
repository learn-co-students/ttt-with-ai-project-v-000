module Players
  class Human < Player
    #code here

    def move(board) #allows a human player to enter a move via CLI
      puts "Please enter 1-9:"
      input = gets.strip
    end

  end
end
