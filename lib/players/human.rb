
module Players
  class Human < Player
    def move(board)
      puts "Your move #{self.token}, enter 1-9:"
      user_input = gets.chomp
      user_input
    end

  end

end
