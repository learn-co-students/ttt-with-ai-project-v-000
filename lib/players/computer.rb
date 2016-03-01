class Player::Computer < Player
  def move(board)
    comp_turn = rand(0-8)
    return "#{comp_turn}"
  end
end
