require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      (@board.cells[win_combination[0]] == "X" && @board.cells[win_combination[1]] == "X" && @board.cells[win_combination[2]] == "X") || (@board.cells[win_combination[0]] == "O" && @board.cells[win_combination[1]] == "O" && @board.cells[win_combination[2]] == "O")
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if !won?
      return nil
    elsif @board.cells[won?[0]] == "X"
      "X"
    elsif @board.cells[won?[0]] == "O"
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
  end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

end
