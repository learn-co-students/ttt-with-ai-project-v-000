module Players
  class Computer < Player
    def move(board)
      poss_input = [1,2,3,4,5,6,7,8,9]
      comp_input = poss_input.sample
      if board.valid_move?(comp_input)
        comp_input.to_s
      else
        self.move.board
      end
    end
  end
end
