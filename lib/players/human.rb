module Players
  class Human < Player

    def move(board)
      puts "What position would you like to occupy?"
      gets.chomp
    end

  end
end