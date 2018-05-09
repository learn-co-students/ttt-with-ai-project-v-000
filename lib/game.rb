require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :winner_token

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
    # make sure all combo element matches (all X | O)
    @board.cells[combo[0]] == @board.cells[combo[1]] &&
    @board.cells[combo[1]] == @board.cells[combo[2]] &&
    # make sure it is not empty
    @board.taken?(combo[0] + 1)
    end
  end

  def winner
    if won = won?
      board.cells[won.first]
   end
 end

  def draw?
    !won? && @board.full?
  end

  def winner
   won? ? @board.cells[won?[0]] : nil
  end

  def turn
    the_move = current_player.move(@board)
    if !@board.valid_move?(the_move)
      puts "invalid"
      turn
     else
      @board.update(the_move, current_player)
    end
  end

  def play
    until over?
      turn
    end

    if won? != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end
