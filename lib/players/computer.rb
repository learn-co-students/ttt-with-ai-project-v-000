module Players
  class Computer < Player
    def move(board)
      #binding.pry
      valid_moves = []
      board.cells.each_with_index do |s, i|
        if s == " "
          valid_moves << (i+1).to_s
        end
      end
      #valid_moves
      #binding.pry
      return valid_moves[0]

    end
  end
end
