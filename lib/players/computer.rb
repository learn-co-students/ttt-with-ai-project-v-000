require 'pry'

module Players
  class Computer < Player

    attr_reader :playermove

    def move(board)


      @playermove = playermove
      # binding.pry
    end

    def random_play(board)
      board.cells.rand

      # board.cells.each do |space|
      #   if space.valid_move?
      #     valid_moves << space.index.to_str
      #   end
        # end
        # binding.pry
        # player_move = valid_moves
        #   if space = " "
        #     avail << space.index.to_str
        #   end
        # end
        # player_move = avail
        # player_move.tap {|space| space.to_str}

  end
end
