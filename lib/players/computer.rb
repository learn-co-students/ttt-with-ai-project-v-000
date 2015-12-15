require "pry"
require_relative '../player.rb'

class Player::Computer < Player

  attr_accessor :best_move, :token

  def move(board)
    minimax(board, 1)
    best_move
  end

  def score(board, depth)
    if self.won?(board)
      if board.cells[self.won?(board)[0]] == self.token
        return 10 - depth
      else
        return depth - 10
      end
    else
      return 0
    end
  end

  def current_player?(board)
    board.turn_count.even? ? self.token == board.token_1 : self.token == board.token_2
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
    WIN_COMBINATIONS.each do |line|
      return line if line.all? { |position| board.cells[position] == "X" }
      return line if line.all? { |position| board.cells[position] == "O" }
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
    scores = [] # an array of scores
    moves = []  # an array of moves

    # Populate the scores array, recursing as needed
    ('1'..'9').reject { |i| board.taken?(i) }.each do |move|
      possible_move = Board.create_and_update(move, board)
      scores << minimax(possible_move, depth)
      moves << move
    end

    # Do the min or the max calculation
    if self.current_player?(board)
      # This is the max calculation
      max_score_index = scores.each_with_index.max[1]
      self.best_move = moves[max_score_index]
      return scores[max_score_index]
    else
      # This is the min calculation
      min_score_index = scores.each_with_index.min[1]
      self.best_move = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end
