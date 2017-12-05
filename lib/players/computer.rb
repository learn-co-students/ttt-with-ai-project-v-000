module Players
  class Computer < Player

    def move(board = nil)
      prng = Random.new
      prng = rand(9) + 1
      prng.to_s
    end



  end
end
