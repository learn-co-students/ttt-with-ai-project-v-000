require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
  [[0, 1, 2], [3, 4, 5], [6, 7, 8], #HORIZONTAL WIN
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #VERTICAL WIN
    [0, 4, 8], [6, 4, 2]] #DIAGONAL WIN

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player #Returns correct player (X = 3rd move). 1st move is X, 2nd is O,...
    #Need to determine which turn (turn_count) to be able to determine the current player (refer to the method I just created in the board class).
    #self.board.turn_count => this will return the number of turns only!!
    #even == 1st player and odd == second player!
    if @board.turn_count.odd?
      player_2
    else #@board.turn_count.even?
      player_1
  end
end


  def won? #Draw? = False ELSE Won? Winning Combo (WINNNING COMBINATIONS)
  #  WIN_COMBINATIONS.detect do |win|
    #  @board.cells[win[0]] == @board.cells[win[1]] &&
    #  @board.cells[win[1]] == @board.cells[win[2]]
    WIN_COMBINATIONS.detect do |win| #Detect or find
      win.all?{|x| @board.cells[x] == "X"} || #.all? returns T if each block never returns false or nil
      #Comparing the WIN_COMBINATIONS to the board.cells
      win.all?{|o| @board.cells[o] == "O"}
    end
  end

  def draw? #not won and full (cannot keep playing)
    !won? && @board.full?
  end

  def over? #draw or won
    self.draw? || self.won?
  end

  def winner #X if X, o if O, nil if none. Need to use won? as helper method to determine first IF the game is won. Then need to return the player token.
      winner = self.won?
      winner ? @board.cells[winner[0]] : nil
  end

  def turn
    puts "#{current_player}'s turn." #Allows each Turn to take in both players (each get 1 turn)
      input = current_player.move(board).to_i #input is set to the current_play (either 1 or 2) and his/her move(board) method which is defined in the player file. This is "gets" as a string. Convert to an integer bc the valid_move method compares integers.
    if board.valid_move?(input.to_s) #now that it is an integer, we can compare it, and then change it back into a string. if valid, the board will update (calling the update method)
      board.update(input, current_player) #if it is not a valid move (position taken or number given outside of range 1-9) then it will tell the user to input answer again and continue to loop through that UNTIl they give a valid_move
    elsif !board.valid_move?(input.to_s)
     puts "Invalid move. Try again"
     turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

    #Ask for input
    #CHECKS IF OVER? after check turn. False or true. If false, keep playing.
end
