module Players

  class Computer < Player
  end

  def move
    if !board.taken?(5)
      "5"
    else
      [1..9].sample.to_s
    end
  end
end
