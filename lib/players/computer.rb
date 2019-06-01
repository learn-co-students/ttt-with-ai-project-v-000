module Players
  class Computer < Player

    def move(board)
      rand(0..9).to_s
    end
  end
end
