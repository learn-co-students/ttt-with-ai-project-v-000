require 'pry'
class Game
  # provides access to: board, player_1, player_2
  attr_accessor :board, :player_1, :player_2

  # defines a constant WIN_COMBINATIONS with arrays for each win combination
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

  # accepts 2 players and a board
  # defaults to two human players, X and O, with am empty board
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # returns the correct player, X, for the third move
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  # returns true for a draw or for a won game
  # returns false for an in-progress game
  def over?
    won? || board.full? || draw?
  end

  # returns false for a draw
  # returns true for a win
  def won?
    WIN_COMBINATIONS.any? do |win_array|
      board.cells[win_array[0]] == "X" && board.cells[win_array[1]] == "X" && board.cells[win_array[2]] == "X" ||
      board.cells[win_array[0]] == "O" && board.cells[win_array[1]] == "O" && board.cells[win_array[2]] == "O"
    end
  end

  # returns true for a draw
  # returns false for a won game or for an in-progress game
  def draw?
    !won? && board.full?
  end

  # returns token of winner
  def winner
    # checks to see if game was won
    if won?
      winning_array = WIN_COMBINATIONS.detect do |win_array|
        board.cells[win_array[0]] == "X" && board.cells[win_array[1]] == "X" && board.cells[win_array[2]] == "X" ||
        board.cells[win_array[0]] == "O" && board.cells[win_array[1]] == "O" && board.cells[win_array[2]] == "O"
      end
      board.cells[winning_array[0]]
    end
  end

  # makes valid moves
  def turn
    input = current_player.move(board)
    #binding.pry

    # asks for input again after a failed validation
    while !board.valid_move?(input)
      # display the valid moves for the user
      puts "These are the only valid moves: #{board.available_moves}"
      input = current_player.move(board)
    end
    # changes to player 2 after the first turn
    board.update(input, current_player)
    board.display
  end

  # plays through an entire game
  def play
    # checks if the game is over after every turn
    until over?
      # plays the first few turns of the game
      turn
    end

    # checks if the game is won after every turn
    if won?
      puts "Congratulations #{winner}!"
    # checks if the game is draw after every turn
    elsif draw?
      puts "Cats Game!" # prints "Cats Game!" on a draw
    end

  end


  ###############################################################
  #                     CLI OPTIONS
  ###############################################################

  # Greet the user with a message
  def greeting
    puts "\n★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"
    puts "  ● WELCOME TO TIC TAC TOE ●"
    puts "★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"

    puts "\n❉ Game Types ❉"
    puts "--------------------------------------------"
    puts ">> 1 << One Player Game"
    puts ">> 2 << Two Players Game"
    puts ">> 0 << The computer will play against itself"
    puts "--------------------------------------------"
  end


  # Gives the player the option of selecting a game type
  def game_type
    greeting

    puts "\nPlease select a Game type"
    type = gets.strip

    until type.match(/[0|1|2]/)
      puts "Please select a valid Game type"
      type = gets.strip
    end


    case type
      when "2"
        game = Game.new(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
      when "1"
        # ask who plays first and verify user input
        puts "Who should go first?\nEnter c for computer or h for human"
        first_player = gets.strip.downcase

        until first_player.match(/[c|h]/)
          puts "Please select a valid player (c for computer or h for human)"
          first_player = gets.strip.downcase
        end

        if first_player == "c"
          player1 = Computer.new("X")
          player2 = Human.new("O")
        elsif first_player == "h"
          player1 = Human.new("X")
          player2 = Computer.new("O")
        end
        game = Game.new(player_1 = player1, player_2 = player2, board = Board.new)
      when "0"
        game = Game.new(player_1 = Computer.new("X"), player_2 = Computer.new("O"), board = Board.new)
    end
  game
end

# Starts the game
def start
  until over?
    play
  end
end

# Returns an answer of "y" or "n" to repeating the game
def repeat?
  answer = ""

  until answer.match(/[y|n]/)
    puts "\nWould you like to play again? (y/n)"
    answer = gets.strip.downcase
    puts "★ Thanks for playing. Come back soon! ★" if answer == "n"
  end
  answer
end

end
