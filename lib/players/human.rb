module Players
  class Human < Player

    def move(board) #method should return the value the user enters. Even though the method accepts a board argument, it does not need to use it.
      puts "Please enter 1-9:"
      gets.strip
    end

  end
end
