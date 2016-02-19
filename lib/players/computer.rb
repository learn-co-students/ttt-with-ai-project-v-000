class Player::Computer < Player
  def move(board) # dumb version
    Random.new.rand(1..9).to_s
  end
end