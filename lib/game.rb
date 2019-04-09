#The Game class is the main model of the application and represents a singular instance of a Tic-tac-toe session.
  #A game has one Board through its board property.
  #A game has two Players stored in a player_1 and player_2 property.
#Board and Player do not directly relate to the Game but do collaborate with each other through arguments.

#Beyond providing relationships with players and a board, the Game instance must also provide the basic game runtime and logic. These methods relate to the state of the game such as #current_player, #won?, and #winner. The other methods relate to managing a game, like #start, #play, and #turn. The test suite describes the method requirements.
class Game
  attr_accessor :board, :player_1, :player_2

  #defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

  #accepts 2 players and a board
  #defaults to two human players, X and O, with an empty board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #returns the correct player, X, for the third move
    #expect(game.current_player.token).to eq("X")
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  #returns false for a draw
  #returns the correct winning combination in the case of a win
  #isn't hard-coded
  def won?
=begin
    WIN_COMBINATIONS.detect do |winner|
      (@board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]]) &&
      (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
=end
    WIN_COMBINATIONS.each do |win_combination|
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
    end
    return false
  end

  #returns true for a draw
  #returns false for a won game
  #returns false for an in-progress game
  def draw?
    @board.full? && !won?
  end

  #returns true for a draw
  #returns true for a won game
  #returns false for an in-progress game
  def over?
    won? || draw? || @board.full?
  end

  #returns true for a full board
  #returns false for an in-progress game
  #@board.full?


  #returns X when X won
  #returns O when O won
  #returns nil when no winner
  def winner
    if winning_combination = won?
      @winner = @board.cells[winning_combination[0]]
    end
  end

  #makes valid moves
  #asks for input again after a failed validation
  #changes to player 2 after the first turn
  def turn
    player = current_player
    input = player.move(@board)
    if !@board.valid_move?(input)
      player.move(@board)
    end
    @board.update(input, player)
    @board.display
  end

  #asks for players input on a turn of the game
  #checks if the game is over after every turn
  #plays the first turn of the game
  #plays the first few turns of the game
  #checks if the game is won after every turn
  #checks if the game is a draw after every turn
  #stops playing if someone has won
  #congratulates the winner X
  #congratulates the winner O
  #stops playing in a draw
  #prints "Cat's Game!" on a draw
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    end

    if draw?
      puts "Cat's Game!"
    end
  end

  #Use the input to correctly initialize a Game with the appropriate player types and token values.
  def self.start
    #Prompt the user for what kind of game they want to play, 0,1, or 2 player.
    puts "What kind of game do you want to play?"
    puts "Enter '0 player', '1 player', or '2 player'"
    game_type = gets.strip

    if game_type == '0 player'
      self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
    end

    #Ask the user for who should go first and be "X"
    if game_type == '1 player'
      puts "Who should go first and be 'X'?"
      puts "Enter 'Computer' or 'Human'"
      first_player = gets.strip
      if first_player == 'Human'
        self.new(player_2 = Players::Computer.new("O")).play
      elsif first_player == 'Computer'
        self.new(player_1 = Players::Computer.new("X")).play
      end
    end

    if game_type == '2 player'
      self.new.play
    end

    #When the game is over, the CLI should prompt the user if they would like to play again
    #and allow them to choose a new configuration for the game as described above.
    #If the user doesn't want to play again, exit the program.
    puts "Would you like to play again? Enter 'Y' or 'N'"
    answer = gets.strip
    if answer == 'N'
      exit!
    elsif answer == 'Y'
      self.start
    end
  end
  #end of start


end
