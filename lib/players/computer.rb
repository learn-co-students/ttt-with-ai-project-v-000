class Player::Computer < Player
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],

    [0,3,6], #verticals
    [1,4,7],
    [2,5,8],

    [0,4,8], #diagonals
    [6,4,2]
    ]

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
    detect_winning_move(board, self.token)
  end

  def block_winning_move(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X"
    detect_winning_move(board, opponent_token)
  end

  def detect_winning_move(board, token_to_test)
    winning_combo = []
    i = 0

    #if two of the three spaces for the winning combo matches, then you're one away from winning
    WIN_COMBINATIONS.each do |combo|
      if winning_combo.empty?
        i += 1 if board.cells[combo[0]] == token_to_test
        i += 1 if board.cells[combo[1]] == token_to_test
        i += 1 if board.cells[combo[2]] == token_to_test
        if i == 2 && combo.any? { |combo_num| !board.taken?(combo_num + 1) } #make sure there's one space open, not O-O-X or X-X-O
          winning_combo = combo
        else
          i = 0
        end
      end
    end

    if !winning_combo.empty?
      final = winning_combo.detect { |combo_num| !board.taken?(combo_num + 1) } #+1 to adjust for user input offset
      final + 1 #to adjust for user input offset
    else
      nil
    end
  end

  def choose_center(board)
    5 if !board.taken?(5)
  end

  def choose_opposite_corner(board)
    if board.taken?(1) && !board.taken?(9)
      9
    elsif board.taken?(3) && !board.taken?(7)
      7
    elsif board.taken?(7) && !board.taken?(3)
      3
    elsif board.taken?(9) && !board.taken?(1)
      1
    end
  end

  def choose_empty_corner(board)
    if !board.taken?(1)
      1
    elsif !board.taken?(3)
      3
    elsif !board.taken?(7)
      7
    elsif !board.taken?(9)
      9
    end
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