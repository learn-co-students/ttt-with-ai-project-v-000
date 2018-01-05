require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
  [0,1,2],#top row
  [3,4,5],#middle row
  [6,7,8],#bottom row
  [0,3,6],#left column
  [1,4,7],#middle column
  [2,5,8],#right column
  [0,4,8],#diagonal 1
  [2,4,6]
  ]

  def current_player
     @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|

      position1 = @board.cells[win_combo[0]]
      position2 = @board.cells[win_combo[1]]
      position3 = @board.cells[win_combo[2]]

      position1 == "X" && position2 == "X" && position3 == "X" || position1 == "O" && position2 == "O" && position3 == "O"

    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      @board.cells[won?.first]
    end
  end

  def turn
    player = current_player
    move = player.move(@board)
    if !@board.valid_move?(move)
      puts "invalid"
      turn
    else
      @board.update(move, player)
      board.display
    end
  end

  def play
    if !over?
      turn
      play
    elsif draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
