require_relative "../player.rb"
module Players
  class Human < Player
    def move(board)
      @board = board
      gets.chomp
    end
  end

end
