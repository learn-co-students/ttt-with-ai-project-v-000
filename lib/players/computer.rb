module Players

  class Computer < Player

    def move(board)
      sleep 1.5
      rand(1..9).to_s
    end

  end

end
