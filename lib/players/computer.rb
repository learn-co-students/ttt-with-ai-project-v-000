module Players
  class Computer < Player
    def move(board)
      move = nil
      rand(1..9).to_s
    end
  end
end