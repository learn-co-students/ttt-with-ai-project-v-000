require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  @@winner_token = nil

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board 
  end

  def current_player 
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_comb|
      if (board.cells[win_comb[0]] == board.cells[win_comb[1]] && 
        board.cells[win_comb[1]] == board.cells[win_comb[2]]) && 
        board.cells[win_comb[0]] != " "

        @@winner_token = board.cells[win_comb[0]]
        return true 
      end
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? @@winner_token : nil
  end

  def turn 
    player_move = current_player.move(board) 
    board.valid_move?(player_move) ? board.update(player_move, current_player) : turn
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end
