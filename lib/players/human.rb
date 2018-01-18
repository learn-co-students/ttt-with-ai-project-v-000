require_relative '../player.rb'

module Players
  class Human < Player

    def move(board, delay = 0)
      puts "What space would you like to move into, player #{self.token}?"
      gets.chomp
    end

  end
end
