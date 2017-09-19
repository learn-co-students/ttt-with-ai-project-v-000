module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9 to place your token there:"
      input = gets.chomp
    end

  end
end
