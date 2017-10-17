module Players

  class Computer < Player

    def move(board)
      selection = Random.rand(1..9).to_s
    end

  end

end
