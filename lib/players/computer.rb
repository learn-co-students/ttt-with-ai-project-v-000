class Player::Computer < Player
  def move(board=nil)
    sleep(1)
    (rand 1..9).to_s
  end
end
