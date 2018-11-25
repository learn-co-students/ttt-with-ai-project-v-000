require "./lib/player"

module Players
  class Computer < Player
    def move(board)
      valid_moves = []
      (1..9).each do |i|
        if board.valid_move?(i)
          valid_moves << i.to_s
        end
      end
      valid_moves.sample
    end
  end
end
