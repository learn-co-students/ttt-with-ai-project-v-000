class Players::Computer<Player
  def move(board)
    position = (1 + rand(9)).to_s
    until board.valid_move?(position)
      position = (1 + rand(9)).to_s
    end
    position
  end
end
