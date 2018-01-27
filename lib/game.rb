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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2

  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if combo.all? {|c| @board.cells[c] == "X"}
        @winner = "X"
        return combo
      elsif combo.all?{|c| @board.cells[c] == "O"}
        @winner = "O"
        return combo
      end
    end
    nil
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won? != nil
      @winner
    end
  end

  def turn
    #makes valid move
    #asks for input after 2 failed validation
    #changes to player 2 after player 1 makes move


  end

  def play

    #asks for players input on a turn of the game
    #checks if the game is over or won or draw after every turn
    #plays the first turn of the game
    #plays the first few turns of the game
    #congratulates X or O as winner
    #prints "Cat's Game" on draw
    #plays through entire game


  end
end
