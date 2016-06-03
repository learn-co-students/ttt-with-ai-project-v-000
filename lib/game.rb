require './config/environment.rb'
require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :choice, :winner_is
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1; @player_2 = player_2; @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end


  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
   
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        position_1
      else
        nil
      end
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def over?
    won? || draw? || self.board.full?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = self.current_player
    current_move = player.move(self, self.board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end


  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def score(game)
    if game.won? && game.current_player == player_1
      return 10
    elsif game.won? && game.current_player == player_2
      return 10
    else
      return 0
    end
  end

  def get_available_moves(game)
    (0..8).select { |i| game.board.cells[i] == " "}.collect{|i| (i + 1).to_s}
  end
  
  def minimax(game)
    return game.score(game) if game.over?
    scores = [] # an array of scores
    moves = []  # an array of moves

    # Populate the scores array, recursing as needed
    get_available_moves(game).each do |position|
      possible_game = game.dup
      possible_move = possible_game.board.update(position, game.current_player)
      scores << possible_game.minimax(possible_game)
      moves << position
    end

    # Do the min or the max calculation
    if game.current_player == game.player_1
      # This is the max calculation
      max_score_index = scores.each_with_index.max[1]
      game.choice = moves[max_score_index]
      return scores[max_score_index]
    else
      # This is the min calculation
      min_score_index = scores.each_with_index.min[1]
      game.choice = moves[min_score_index]
      return scores[min_score_index]
    end
  end

end