require 'pry'
module Players

  class Computer < Player

    def move(board)
      valid_moves = Board.new.cells.map.with_index(1) do |v, i|
        if v == " "
          i.to_s
        end
      end
      valid_moves.find{|valid_move| valid_move}
      # binding.pry
    end
    # binding.pry
  end
end
