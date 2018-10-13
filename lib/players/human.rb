require_relative "../player.rb"

module Players
  class Human < Player
    def move(board)
      gets.strip
    end
  end
end
