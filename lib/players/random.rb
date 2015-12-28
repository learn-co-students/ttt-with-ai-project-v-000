class Player::Random < Player
  def move(board)
    ('1'..'9').reject { |i| board.taken?(i) }.sample
  end
end