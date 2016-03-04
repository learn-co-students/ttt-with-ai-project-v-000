class Player::Computer < Player

  def move(board)
    require "pry" ; binding.pry
    if !board.taken?(5)
      "5"
    else
      [*("1".."9")].sample
    end
  end

end
