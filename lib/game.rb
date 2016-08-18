require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :depth

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
    [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
    [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
    [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
    [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
    [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
    [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
    [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @depth = 0
  end

  def current_player
    self.board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def current_opponent
    self.board.turn_count % 2 == 0 ? @player_2 : @player_1
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      self.board.taken?((win_combo[0] + 1).to_s) &&
      self.board.cells.values_at(win_combo[0]) == self.board.cells.values_at(win_combo[1]) &&
      self.board.cells.values_at(win_combo[1]) == self.board.cells.values_at(win_combo[2])
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if winning_combo = self.won?
      self.board.cells[winning_combo.first]
    end
  end
  ## why does this work?? ^

  def turn
    self.board.display
    current_move_number = current_player.move(board)
    if !self.board.valid_move?(current_move_number)
      puts "#{current_move_number} is already taken, pick another place to move"
      turn
    else
      puts "#{current_player.token} moved to position #{current_move_number}"
      self.board.update(current_move_number, current_player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  # def score
  #   if won? && winner == current_player
  #     return 10 - depth
  #   elsif won? && winner == current_opponent
  #     return depth - 10
  #   else
  #     return 0
  #   end
  # end

  # def minmax
  #   return score if self.over?
  #   @depth += 1
  #   scores = [] # an array of scores
  #   moves = []  # an array of moves

  #   # Populate the scores array, recursing as needed
  #   board.available_positions.each do |position|
  #     player = self.current_player
  #     possible_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
  #     possible_game.board.update(position, player)
  #     scores << possible_game.minmax
  #     moves << position
  #   end

  #   max_score_index = scores.each_with_index.max[1]
  #   min_score_index = scores.each_with_index.min[1]

  #   if scores[max_score_index] > 0
  #     best_move = moves[max_score_index]
  #   else
  #     best_move = moves[min_score_index]
  #   end
  #   best_move
  # end

end