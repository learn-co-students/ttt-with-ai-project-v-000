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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

#state of the game

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    #binding.pry
    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        win_set = [win_index_1, win_index_2, win_index_3]
        return win_set # return the win_combination indexes that won.
      end
    end
    false
  end

  def over? #returns true for a draw, returns true for a won game, returns false for an in-progress game
    if won? || draw?
      true
    else !@board.full?
      false
    end
  end

  def draw?
    if @board.full? && !won? #returns true for a draw
      true
    else won? || !@board.full? #returns false for a won game, #returns false for an in-progress game
      false
    end
  end

  def winner #returns X when X won, returns O when O won, returns nil when no winner
    #binding.pry
    if winning = won?
      @winner = @board.cells[winning.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move) #makes valid moves #asks for input again after a failed validation
      turn
      @board.display
    else #changes to player 2 after the first turn
      @board.update(current_move, player)
      @board.display
    end
  end

  def play
   while !over? #checks if the game is over after every turn
    turn
   end
   if won? #checks if the game is won after every turn
     puts "Congratulations #{winner}!" #congratulates the winner X / congratulates the winner O #stops playing if someone has won
   else draw? #checks if the game is a draw after every turn
     puts "Cat's Game!" #prints "Cat\'s Game!" on a draw #stops playing in a draw
   end
  end
  
end
