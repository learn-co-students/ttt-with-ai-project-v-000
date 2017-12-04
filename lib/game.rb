class Game
  #A game has one Board through its board property.
# A game has two Players stored in a player_1 and player_2 property.

#The Game instance must also provide the basic game runtime and logic. These methods relate to the
# state of the game such as #current_player, #won?, and #winner. The other methods relate to managing
# a game, like #start, #play, and #turn. The test suite describes the method requirements.

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

  #accepts 2 players and a board
    #defaults to two human players, X and O, with an empty board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  # Game #current_player returns the correct player, X, for the third move
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

# Game #won? returns the correct winning combination in the case of a win
# Game #won? isn't hard-coded
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  # Game #draw? returns false for a won game
  def draw?
    @board.full? && !won?
  end

  # Game #winner returns X when X won
# Game #winner returns O when O won
# Game #winner returns nil when no winner

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  #Game turn makes valid moves
  # Game turn asks for input again after a failed validation
  # Game turn changes to player 2 after the first turn

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  # Game play asks for players input on a turn of the game
# checks if the game is over or draw after every turn
# plays the first turn of the game
# plays the first few turns of the game
 # Game play stops playing if someone has won
 # Game play congratulates the winner X and O
 # Game play plays through an entire game

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

  # Game turn makes valid moves
# Game turn asks for input again after a failed validation
   # Game turn changes to player 2 after the first turn
  def turn
      player = current_player
      current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
      else
        puts "Turn: #{@board.turn_count+1}\n"
        @board.display
        @board.update(current_move, player)
        puts "#{player.token} moved #{current_move}"
        @board.display
        puts "\n\n"
      end
    end

    #over? returns true for a won game, isn't hard-coded
  def over?
    won? || draw?
  end


end
