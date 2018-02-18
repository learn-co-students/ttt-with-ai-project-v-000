module Players
  class Human < Player

    def move(board)
      puts "Please input a cell number:"
      input = gets.chomp
    end

  end
end
