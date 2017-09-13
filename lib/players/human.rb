module Players
  class Human < Player

    #move asks the user for input and returns it

    def move(board)
      board.display
      puts "Please select a position on the board."
      user_input = gets.chomp
      user_input
    end
  end
end
