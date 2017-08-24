module Players #Ruby recognizes that there is only one Players module, even though it is split across different files.|
  class Computer < Player

    def move(array)
      try_move = (1+rand(8)).to_s
    end

  end
end
