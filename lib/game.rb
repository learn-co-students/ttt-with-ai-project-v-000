##### `game.rb` - `Game`
#The `Game` class is the main model of the application and represents a singular instance of a Tic-tac-toe session.

#  * A game has one `Board` through its `board` property.
#  * A game has two `Player`s stored in a `player_1` and `player_2` property.

#`Board` and `Player` do not directly relate to the `Game` but do collaborate with each other through arguments.

#Beyond providing relationships with players and a board, the `Game` instance must also provide the basic game runtime
#and logic. These methods relate to the state of the game such as `#current_player`, `#won?`, and `#winner`. The other
#methods relate to managing a game, like `#start`, `#play`, and `#turn`. The test suite describes the method requirements.
require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :cells, :token
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 =@player_1, player_2 = @player_2, board = @board)
    @board = Board.new
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Human.new("O")
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def current_player
    @token = board.turn_count.even? ? "X" : "O"
    @token
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if board.cells[combo[0]] != " " && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
        return combo
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    if draw? || won?
      true
    elsif !board.full?
      false
    end
  end

  def winner
    if combo = won?
      board.cells[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      "invalid"
      turn
    end
      
  end
end
