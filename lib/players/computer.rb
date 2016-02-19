class Player::Computer < Player
  def move(board) # dumb version
    sleep(0.3)
    Random.new.rand(1..9).to_s
  end
end