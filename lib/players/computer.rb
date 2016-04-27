class Player::Computer < Player

  def move(board)
    puts "Computer chooses a spot..."
    choice = Random.new.rand(1..9).to_s
    choice
  end
end
