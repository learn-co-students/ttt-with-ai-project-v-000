require "pry"

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even?  ? player_1 : player_2
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0])
    end
  end
  def draw?
    board.full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    board.cells[won?[0]] if won?
  end
  def turn
    puts "It is now #{current_player}'s turn. Please enter 1-9:"
    input = gets.strip.to_i
    if board.valid_move?(input.to_s)
      board.update(input, current_player)
      display_board
    elsif input.between?(1, 9) == false
      puts "That is an invalid move"
      turn
    else
      puts "Whoops! Looks like that position is taken"
      turn
    end
  end
  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
Game.new
