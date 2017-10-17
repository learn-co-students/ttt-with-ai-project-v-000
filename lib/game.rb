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
    [6,4,2]
  ]

  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    self.won? || self.draw?
  end

  def draw?
    @board.full? && !won?
  end

  def won? #returns false for a draw, returns the correct winning combination in the case of a win
    #binding.pry
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] != " " &&
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def winner #returns X when X won, returns O when O won, returns nil when no winnter
    if winning = won?
      @winner = board.cells[winning.first]
    end
  end

  def turn #makes valid moves, asks for input again after a failed validation, changes to player 2 after the first turn
    player = current_player
    current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
        @board.display
      else
        @board.update(current_move, player)
        @board.display
      end
  end

  def play
    #asks for players input on a turn of the game,
    #checks if the game is over after every turn,
    #plays the first turns of the game,
    #checks if the game is a draw after every tur
    #stops playing if someone has won
    #congratulates the winner
    #stops playing in a draw,
    #plays through an entire game
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
