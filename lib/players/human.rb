module Players
  class Human < Player

    def move(board)
      puts "Choose square 1-9 to place your token!"
      gets.chomp
    end

  end
end
