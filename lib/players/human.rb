module Players
  class Human < Player  #inherits from Player

    def move(board)
      puts "Player '#{self.token}', please enter a valid move" #asks the user for input and returns it
      your_move = gets.chomp
      your_move
    end
  end

end
