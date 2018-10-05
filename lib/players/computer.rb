module Players
  class Computer < Player

    def move(board)

      if board.turn_count = 0
          new_move = ["1","3","7","9"].sample
        elsif [0,3,6,8].detect{|x| board.cells[x] == self.token}

        else
          new_move = (1..9).to_a.sample.to_s
          
        end

      board = new_move
    end


  end
end
