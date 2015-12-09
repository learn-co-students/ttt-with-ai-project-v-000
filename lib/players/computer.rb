class Player::Computer < Player
  attr_accessor :intelligent_move

  def move(board)
    return '5' unless board.taken?('5')
    self.minimax(board, 1)
    self.intelligent_move
  end

  def score(board, depth)
    if self.won?(board)
      if board.cells[self.won?(board)[0]] == self.token
        return 10 - depth
      else
        return depth - 10
      end
    else
      0
    end
  end

  def current_player?(board)
    if board.turn_count % 2 == 0
      self.token == board.token_1
    else
      self.token == board.token_2
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if (position_1 == board.token_1 && position_2 == position_1 && position_3 == position_1) || (position_1 == board.token_2 && position_2 == position_1 && position_3 == position_1)
        return win_combination
      end
    end
    false
  end

  def draw?(board)
    board.full? && !self.won?(board)
  end

  def over?(board)
    self.draw?(board) || self.won?(board)
  end

  def minimax(board, depth)
    return score(board, depth) if self.over?(board)
    depth += 1
    scores = []
    moves = []
    # Fill the scores array.
    ('1'..'9').reject { |i| board.taken?(i) }.each do |choice|
      move_scenario = Board.create_and_update(choice, board)
      scores << minimax(move_scenario, depth)
      moves << choice
    end
    # Do the min/max calculation.
    if self.current_player?(board)
      max_score_index = scores.each_with_index.max[1]
      self.intelligent_move = moves[max_score_index]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      self.intelligent_move = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end