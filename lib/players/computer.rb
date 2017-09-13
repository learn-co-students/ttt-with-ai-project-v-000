module Players

  class Computer < Player
    def move(board)
      input = rand(1...10)
      sleep 1
      input.to_s
    end
  end

end