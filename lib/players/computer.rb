class Player::Computer < Player
  def move(board)
    random_move(board)
  end
  
  def random_move(board)
    num = 0
    loop do
      num = rand(1...10) #random number 1-9
      break if !board.taken?(num)
    end
    num.to_s
  end
end