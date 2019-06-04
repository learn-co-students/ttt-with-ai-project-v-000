module Players
  class Human < Player

    def move(board_argument)
      puts "please choose a space 1-9"
      board_argument.display
      user_input = gets.strip
    end

  end
end
