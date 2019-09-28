require_relative '../player.rb'

module Players

  class Human < Player

    def move(board)
      puts "Enter a position 1-9:"
      user_input = gets.chomp
    end

  end

end
