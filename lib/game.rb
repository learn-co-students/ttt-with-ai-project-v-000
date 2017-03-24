require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winning_token
  include Players

  #all win combos
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st column
    [1,4,7], #2nd column
    [2,5,8], #third column
    [0,4,8], #1 diagonal
    [2,4,6] #2nd diagonal
  ]

  #initialize game with default human players and board if no arguments are given
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #returns current player based on the turn count
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  #checks if game has been won
  def won?
    #iterate throguh the combination to check if either X or O is the winner
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        @winning_token = "X"
        puts "Congratulations X!"
        return true
      end
      if @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        @winning_token = "O"
        puts "Congratulations O!"
        return true
      end
    end
    return false
  end

  #returns the token of the winner if the game as been won
  def winner
    if won? #winning_token
      return @winning_token
    end
    return nil
  end

  #checks if the game is over by seeing if there is a win or a draw
  def over?
    if won? #winning_token
      return true
    end
    if draw? #board.full?
      return true
    end
    return false
  end

  #allows the game to turn
  def turn
    #uses board update using the Player move method
    @board.update(current_player.move(@board), current_player)
    #displays the turn
    @board.display
    puts "***************************"
    puts ""
  end

  #plays the game until the game is over
  def play
    #until over is true the game will call turn, and check for won or draw
    until over?
      turn
      won?
      draw?
    end
  end

  #checks if the game is a draw by seeing if there is no winner and the board is full
  def draw?
    if won? #winning_token
      return false
    end
    if @board.full?
      puts "Cat's Game!"
      return true
    end
    return false
  end


end
