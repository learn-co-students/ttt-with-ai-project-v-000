module Players
  class Human < Player

    def move(board_argument)


      board_argument.display

      puts "please choose a space 1-9"

      user_input = gets.strip
    end

  end
end
