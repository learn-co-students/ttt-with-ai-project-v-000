require_relative '../config/environment.rb'

class Game

  attr_accessor :board, :player_1, :player_2


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    win = nil
    WIN_COMBINATIONS.each do |combo|
      win = combo if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[1] + 1)
    end
    win
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    board.position(won?[1] + 1) if won?
  end

  def turn
    board.display
    puts "Where would you like to go? [1 - 9]"
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def play
    turn until over?
    board.display
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end

  end


end
