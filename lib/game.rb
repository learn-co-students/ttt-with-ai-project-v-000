require "pry"
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :tokens

  WIN_COMBINATIONS = [
    [0, 1, 2], #top_row_win
    [3, 4, 5], #middle_row_win
    [6, 7, 8], #bottom_row_win
    [0, 3, 6], #left_collumn_win
    [1, 4, 7], #middle_collumn_win
    [2, 5, 8], #right_collumn_win
    [0, 4, 8], #left_diagonal_win
    [2, 4, 6] #right_diagonal_win
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? || self.board.full?
  end

  def win_tokens
    @tokens = WIN_COMBINATIONS.map {|combo| combo.map {|index| board.cells[index]}}
    # return the token at each index of each array of winning combos relative to the game board
    # which is now an instance variable, reader access granted in attr_reader
  end

  def won?
    win_tokens
    tokens.include?(["X", "X", "X"]) || win_tokens.include?(["O", "O", "O"])
    # true if the tokens array from win_tokens includes a set of all Xs or all Os
  end


  def draw?
    !won? && board.full?
  end

  def winner
    win_tokens
    winning_combo = tokens.detect {|combo| combo == ["X", "X", "X"] || combo == ["O", "O", "O"]}
    # the first match of all Xs or all Os is now saved as a variable
    won? ? winning_combo[0] : nil
  end

  def turn
    player = current_player
    move = player.move(board)
    puts "#{current_player.token} is taking their turn..."
    if board.valid_move?(move)
      board.update(move, player)
      board.display
      # sleep 3
    else
      board.display
      # sleep 3
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

  def self.start # CLI setup here
    # puts out a board with position numbers before calling any turns
    puts "Hello there! Would you like to play a game of Tic Tac Toe? Please select from the following:"
    puts "0 = computer versus itself"
    puts "1 = computer versus you"
    puts "2 = you versus your human friend"
    puts "What do you choose?"
    game_type = gets.chomp
    #binding.pry
    # ask for who goes first BASED on the type of game - if/else
    # puts "Who should go first and be X?"
    # puts "0 = computer goes first"
    # puts "1 = you go first"
    # puts "2 = your friend goes first"
    # puts "What do you choose?"
    # first = gets.chomp

    # based on the game_type, create a game with zero, one or two players
    # with first as player_1's token
    # remember that new games have three arguments
    # recap the selections before calling #turn
    if game_type == "0"

      game = self.new(Players::Computer.new("X"), Players::Computer.new("O"))
      puts "The players are: 1) Computer as X and 2) Computer as O."
      game.play
      if game.over?
        puts "Would you like to play another game? 1 = Yes, 2 = No"
        another = gets.chomp
        if another == 1
          self.class.start
        else
          puts "Thank you and farewell!"
          exit
        end
      end
    end # end of computer v computer
  end
end
