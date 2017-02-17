module Players
  class Human < Player

    def move(board)
      puts "Enter position:"
      gets.strip
    end

  end
end
