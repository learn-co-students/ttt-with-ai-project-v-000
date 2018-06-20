module Players
  class Computer < Player

    def move(board)
      num = rand(1..9)
      num.to_s
    end

  end



end
