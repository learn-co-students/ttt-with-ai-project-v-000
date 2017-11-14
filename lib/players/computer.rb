require_relative "../player.rb"

module Players
  class Computer < Player
    def move(board)
      move = 1+rand(8)
      #binding.pry
      while board.taken?(move.to_s)
        move = 1+rand(8)
      end
      move.to_s
    end
  end
end
