require_relative "../player.rb"

module Players
  class Human < Player
    def move(board, game)
      input = gets.strip
    end
  end
end
