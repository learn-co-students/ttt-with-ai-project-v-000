class Computer < Player

  def move(board = nil)
    [*1..9].sample.to_s
  end
end