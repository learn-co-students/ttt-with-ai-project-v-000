module Players
  class Human < Player  #inherits from Player

    def move(token) #asks the user for input and returns it
      puts "Player '#{token}', please enter a valid move"
      board_cell = gets.chomp
      board_cell
    end
  end

end
