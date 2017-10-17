
module Players
  class Human < Player
    def move(board)
      puts "Where to move?, enter 1-9:"
      user_input = gets.chomp
      user_input
    end

  end

end
