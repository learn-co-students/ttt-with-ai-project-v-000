module Players
  class Computer < Player
    def move(board)
      "1"
    end
  end
end


# possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
# valid_moves = []
# possible_moves.each do |input|
#   binding.pry
#   valid_moves << input if board.valid_move?(input.to_i-1)
#   board.valid_move?(input.to_i-1)
# end
# valid_moves
