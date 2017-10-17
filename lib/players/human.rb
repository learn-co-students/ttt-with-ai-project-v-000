
module Players
  class Human < Player
    def move(board)
      puts "Where to move?"
      user_input = gets.chomp
    end

  end

end
