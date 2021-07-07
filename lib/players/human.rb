module Players
  class Human < Player

    def move(board)
      puts "Please make your move by entering 1-9:"
      user_input = gets.chomp
    end

  end
end
