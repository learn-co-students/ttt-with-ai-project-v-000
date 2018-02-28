require_relative '../player.rb'

module Players

  class Human < Player

    def move(board)
      user_input = gets.chomp
    end

  end

end
