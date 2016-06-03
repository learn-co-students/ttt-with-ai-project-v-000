require './config/environment.rb'
require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :choice
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1; @player_2 = player_2; @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?(player=nil)
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
   
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") && player == (self.player_1 || nil)
        true
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O") && player == (self.player_2 || nil)
        true
      end
    end
  end

  def full?
    if self.board.cells.all?{|i| (i == "X") || (i == "O")}
      true
    else 
      false
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else 
      false
    end
  end

  def winner
    if the_winner_combo = won?
      self.board.cells[the_winner_combo.first]
    end
  end


  def turn
    position = self.current_player.move(self, self.board)
    if !self.board.valid_move?(position)
      turn
    else
      self.board.update(position.to_i, current_player)
    end
  end

  def play
    until over?
      self.board.display
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def score
    if self.won?(self.player_1)
      return 10
    elsif self.won?(self.player_2)
      return 10
    else
      return 0
    end
  end

  def get_available_moves
    (0..8).select { |i| self.board.cells[i] == " "}.collect{|i| (i + 1).to_s}
  end
  
  def minimax
    return score if self.over?
    scores = [] # an array of scores
    moves = []  # an array of moves

    # Populate the scores array, recursing as needed
    self.get_available_moves.each do |position|
      possible_game = self.dup
      possible_move = possible_game.board.update(position, self.player_1)
      scores << possible_game.minimax
      moves << position
    end

    # Do the min or the max calculation
    if self.current_player == self.player_1
      # This is the max calculation
      max_score_index = scores.each_with_index.max[1]
      self.choice = moves[max_score_index]
      return scores[max_score_index]
    else
      # This is the min calculation
      min_score_index = scores.each_with_index.min[1]
      self.choice = moves[min_score_index]
      return scores[min_score_index]
    end
  end

end