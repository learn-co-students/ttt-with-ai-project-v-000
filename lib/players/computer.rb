module Players
  class Computer < Player

    def move(board)
      corner = %w(1 3 7 9).sample
      edge = %w(2 4 6 8).sample
      center = '5'
      sleep(1.5)
      if board.valid_move?(center)
        center
      elsif board.valid_move?(corner)
        corner
      elsif board.valid_move?(edge)
        edge
      else
        rand(1..9).to_s
      end
    end

  end
end
