require 'pry'
class Game

	attr_accessor :player_1, :player_2, :board, :winner


  # Winning combinations to win a game of Tic Tac Toe
	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  # Initialize the game with default players and board - defaults to a two human players game
	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
    player_1.player = "Player one" # Give the players a name to differentiate between them
		@player_2 = player_2
    player_2.player = "Player two" # Give the players a name to differentiate between them
		@board = board
	end

  # Whose turn is it - identify the current player by which turn the game is up to
  # Player one goes first with the "X" token
	def current_player
		if board.turn_count.odd?
			player_2  # If the number of turns is an odd number it is Player two with the "O" token
		else
			player_1  # If the number of turns is an even number it is Player one with the "X" token
		end
	end

  # Is the game over - if the board is full there are no move valid moves so the game is over
  # If the game is drawn or won the game is over
	def over?
		true if board.full? || draw? || won?
	end

  # Is the game a draw - the board is full and no one has won (no one has gotten one of the winning combinations)
	def draw?
		true if board.full? && !won?
	end

  # Has a player won the game?
	def won?
    # Check all of the winning combinations - does won of the tokens occupy all three cells in the winning combination?
			WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
      end
	end

  # Returns the winner of the game
	def winner
    if board.turn_count.odd? 
      winner = "X"  # The player with the "X" token has won the game
    else
      winner = "O"  # The player with the "O" token has won the game
    end
	end

  # Plays the game of Tic Tac Toe - asks the players to take a turn
  # Checks to see if the game is over and whether it has been won or drawn after each turn
  def play
    until over?
      turn  # If the game isn't over the next player gets a turn
    end
    if over?
      puts "game over"  # Let the players know the game is over
      if won?  # Is the game over because a player has won?
        board.display  # Display the winning board
        puts "Congratulations #{winner}!"  # Congratulate the winner
      end
      if draw?  # Is the game over because the game is a draw?
        board.display  # Display the drawn board
        puts "Cat's Game!"  # Let the players know the game is a draw
      end
    end
  end

  # Checks for a valid move on each turn
  def invalid_move?(current_player, input)
    while !board.valid_move?(input)  # Check the board cell for a valid move
      puts "invalid move please check the grid and enter another position (1 to 9):"
      if current_player.class == Players::Computer  # Is the player a Computer or a Human
        input = current_player.move(board)  # Receive input from the Computer player
      else
        input = current_player.move(input)  # Receive input from the Human player
      end
      board.valid_move?(input)  # Checks that the player's new move is valid
    end
    board.update(input, current_player)  # Updates the board with the player's move
  end

  # Asks the players for input for their turn of the game
  def player_input(current_player)
    board.display  # Displays the current board so the player can see the available moves
    puts "#{current_player.player} please enter the grid position number you want (1 to 9):"
    if current_player.class == Players::Computer  # Is the player a Computer or a Human
      input = current_player.move(board)  # Receive input from the Computer player
    else
      input = current_player.move(input)  # Receive input from the Human player
    end
    invalid_move?(current_player, input)  # Checks that the player's move is valid
    board.update(input, current_player)  # Updates the board with the player's move
  end

  # Plays a turn of the game - checks for the correct player and asks them to take a turn
	def turn
    if player_1 == current_player
      player_input(current_player)  # If player one is the current player it is their turn
    else player_2 == current_player
      player_input(current_player)  # If player two is the current player it is their turn
    end
	end
end
