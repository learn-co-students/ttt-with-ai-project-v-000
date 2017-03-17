require_relative '../player.rb'

module Players
  class Human < Player

    def move(board)
      puts "What space would you like to move into?"
      input = gets.chomp
    end

  end
end
