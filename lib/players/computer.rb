class Player::Computer < Player
  def move(board)
    #1. Make winning move
    location = make_winning_move(board)

    #2. Block winning move
    location = block_winning_move(board) if location.nil?

    #3. Center
    location = choose_center(board) if location.nil?

    #4. Opposite corner
    location = choose_opposite_corner(board) if location.nil?

    #5. Empty corner
    location = choose_empty_corner(board) if location.nil?

    #6. Random move
    location = make_random_move(board) if location.nil?

    location.to_s
  end

  def make_winning_move(board)

  end

  def block_winning_move(board)

  end

  def choose_center(board)
    5 if !board.taken?(5)
  end

  def choose_opposite_corner(board)

  end

  def choose_empty_corner(board)

  end

  def make_random_move(board)
    num = 0
    loop do
      num = rand(1...10) #random number 1-9
      break if !board.taken?(num)
    end
    num
  end
end