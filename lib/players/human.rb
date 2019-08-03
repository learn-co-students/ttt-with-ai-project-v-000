module Players
  class Human < Player
    # your code here

    def move(board)
      puts "Please enter 1-9:"
      gets.chomp
    end

  end
end
