require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :cells
  attr_reader :WIN_COMBINATIONS

# Game initialize accepts 2 players and a board
# Game initialize defaults to two human players, X and O, with an empty board
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

# Game ::WIN_COMBINATIONS defines a constant WIN_COMBINATIONS with arrays for each win com
  WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

# Game #board provides access to the board
  def board=(board)
    @board = board
  end

# Game #player_1 provides access to player_1
  def player_1=(player_1)
    @player_1 = player_1
  end

# Game #player_2 provides access to player_2
  def player_2=(player_2)
    @player_2 = player_2
  end

# Game #current_player returns the correct player, X, for the third move
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

# Game #over? returns true for a draw
# Game #over? returns true for a won game
# Game #over? returns false for an in-progress game
  def full?
    board.cells.any? {|i| i == " "}
  end

  def over?
    won? || draw?
  end

# Game #won? returns false for a draw
# Game #won? returns true for a win
  def won?
     WIN_COMBINATIONS.any? do |wc|
       board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X" ||
       board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
     end
  end

# Game #draw? returns true for a draw
# Game #draw? returns false for a won game
# Game #draw? returns false for an in-progress game
  def draw?
    board.full? && !won?
  end

# Game #winner returns X when X won
# Game #winner returns O when O won
# Game #winner returns nil when no winner
  def winner
    if won?
      WIN_COMBINATIONS.any? do |wc|
        if board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X"
          return "X"
        elsif board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
          return "O"
        end
      end
    end
  end

# Game turn makes valid moves
# Game turn asks for input again after a failed validation
# Game turn changes to player 2 after the first turn
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts "That is not a valid move."
      turn
    end
    board.display
  end

# Game play asks for players input on a turn of the game
  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end
end
