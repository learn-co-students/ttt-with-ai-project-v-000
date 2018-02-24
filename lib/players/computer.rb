require 'pry'

module Players

  class Computer < Player
    attr_accessor :board, :game


    def move(board = Board.new)
      # binding.pry
      if self.game != nil
        move_index = self.game.board.cells.collect.with_index{|pos, i| i + 1 if pos == " "}.sample
      else
        @board = board
        move_index = board.cells.collect.with_index{|pos, i| i + 1 if pos == " "}.sample
      end
      move_num = move_index.to_s

    end

  end

end
