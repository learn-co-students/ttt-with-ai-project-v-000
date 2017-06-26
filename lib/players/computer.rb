require 'pry'
module Players
  class Computer < Player

    def move(board)
      moves = []
      board.cells.each_with_index{|val, ind| moves << (ind + 1).to_s if !board.taken?(ind)}
      index = rand(0..moves.length)
      moves[index]
    end

  end
end
