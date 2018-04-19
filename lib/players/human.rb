module Players

  class Human < Player

    def move(board)
      puts "Please enter 1-9 to move:"
      gets.strip
    end # move

  end # class Human


end # module Players
