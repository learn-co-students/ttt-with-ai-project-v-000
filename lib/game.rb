require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :cells
  attr_reader :WIN_COMBINATIONS

# Game initialize accepts 2 players and a board
# Game initialize defaults to two human players, X and O, with an empty board
# Game #board provides access to the board
# Game #player_1 provides access to player_1
# Game #player_2 provides access to player_2
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
      puts "That is not a valid move. Please choose another number."
      turn
    end
    board.display
    puts "Next player:"
  end

# Game play asks for players input on a turn of the game
# Game play checks if the game is over after every turn
# Game play plays the first turn of the game
# Game play plays the first few turns of the game
# Game play checks if the game is won after every turn
# Game play checks if the game is a draw after every turn
# Game play stops playing if someone has won
# Game play congratulates the winner X
# Game play congratulates the winner O
# Game play stops playing in a draw
# Game play prints "Cat's Game!" on a draw
# Game play plays through an entire game
  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end

#   def start
#     humans = nil
#     puts "Welcome to Tic Tac Toe! How many humans are playing today, one or two?"
#     humans = gets.chomp
#       if humans == 2
#         self.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
#       elsif humans == 1
#         self.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
#       elsif humans == 0
#         self.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new)
#       end
#   end
# end

def start
  puts "How many players for this game?\n0 = computer plays itself; 1 = you play the computer; 2 = you and a friend play"
  puts "Or...play wargames = computer plays itself 100 times (0/1/2/wargames)"
  ARGV.clear
  total_players = gets.strip

  case total_players
  when "0"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  when "1"
    puts "Player 1 is X and goes first.  Type 'X' to be Player 1.\nOtherwise, type 'O' to be Player 2, and the computer will go first."
    # ARGV.clear
    choice = gets.strip.upcase
    if choice == "X"
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    else
      Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
    end
  when "2"
    puts "Player 1 is X and goes first; Player 2 is O."
    Game.new().play
  # when "wargames"
    # Game.new(Players::Computer.new("X"), Players::Computer.new("O")).wargames
  end

  sleep(1)

  play_again
end
#play_again controls playing another game
def play_again

  puts "\nWould you like to play again? (y/n)"
  again = gets.strip.upcase

  if again == "Y" || again == "YES"
    start
  else
    exit_game
  end
end

#exit_game controls ending of game
  def exit_game
    sleep(2)
    puts "Okay, bye then!"
  end
end
