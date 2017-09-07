require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]
  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def draw?
    !won? && @board.full?
  end

  def won?
    WIN_COMBINATIONS.find {|combo| (@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]) && (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")}
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    player = current_player
    move = player.move(board)
    if !@board.valid_move?(move)
      turn
    else
      @board.update(move, player)
      board.display
    end
  end

  def play
    until over?
    turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
    end
  end
end
