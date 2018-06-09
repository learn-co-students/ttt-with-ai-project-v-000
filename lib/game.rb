require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :winner
# attr_accessor provides access to board, player_1, player_2

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
  ]

#default to two human players, X and O, with an empty board
#create new human players by Players(module)::Human(class)
#create a new board, Board.new
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1 #assign to instance variables
    @player_2 = player_2
    @board = board
  end

  def current_player #returns the correct player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo| # ["X", "X", "X"]
      if @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
         @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
         @board.taken?(win_combo[0]+1) # returns nil when no winner
        return win_combo
      end
    end
    return false
  end

  def draw?
    !won? && @board.full?
    #If not won and board is full then true, else false
  end

  def over?
    won? || draw?
    #if game is won, game is over true
    #if draw is true, game is over is true
  end

  def winner # returns token of winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    else puts "Enter a valid Move 1-9:"
      @board.display
      turn
    end
    @board.display
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
