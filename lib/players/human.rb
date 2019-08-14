require_relative "../player.rb"

module Players
  class Human < Player
    def move(board)
      input = gets.chomp
      return input
    end
  end
end
