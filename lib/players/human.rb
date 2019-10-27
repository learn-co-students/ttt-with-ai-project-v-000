module Players
  class Human < Player

  def move(input)
    Board.new(input)
  end

  end
end
