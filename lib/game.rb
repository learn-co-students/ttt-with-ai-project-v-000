class Game
  attr_reader :WIN_COMBINATIONS, :board, :player_1, :player_2

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
# Game initialize accepts 2 players and a board
# Game initialize defaults to two human players, X and O, with an empty board
  def initialize(player_1, player_2, board)
    player_1 = "X"
    player_2 = "O"
    board = []
  end

# Game #current_player returns the correct player, X, for the third move

# Game #over? returns true for a draw
# Game #over? returns true for a won game
# Game #over? returns false for an in-progress game
  # def over?(board)
  #   draw?(board) == true || won?(board) != nil
  # end

# Game #won? returns false for a draw
# Game #won? returns true for a win
  # def won?(board)
  #   WIN_COMBINATIONS.find do |win_combination|
  #     board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
  #   end
  # end

# Game #draw? returns true for a draw
# Game #draw? returns false for a won game
# Game #draw? returns false for an in-progress game
  # def draw?(board)
  #   won?(board) == nil && full?(board) == true
  # end

# Game #winner returns X when X won
# Game #winner returns O when O won
# Game #winner returns nil when no winner
  # def winner(board)
  #   if won?(board) != nil
  #     winner = board[won?(board)[0]]
  #   end
  # end

# Game turn makes valid moves
# Game turn asks for input again after a failed validation
# Game turn changes to player 2 after the first turn
  # def turn(board)
  #   puts "Please enter 1-9:"
  #     input = gets.strip
  #     index = input_to_index(input)
  #     m = valid_move?(board, index)
  #   if m == true
  #     character = current_player(board)
  #     move(board, index, character)
  #   else m == nil
  #     puts "Sorry, that was an invalid move. Please enter 1-9:"
  #     display_board(board)
  #     # turn(board)
  #     input = gets.strip
  #     index = input_to_index(input)
  #     m = valid_move?(board, index)
  #   end
  # end

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

end
