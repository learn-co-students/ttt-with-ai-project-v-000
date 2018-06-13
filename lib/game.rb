##
# => Game handles the functionality of the Tic-Tac-Toe game
##
class Game
  # => creates getters and setters for the instance variables
  attr_accessor :board, :player_1, :player_2, :num_players

  ##
  # => Instantiates a game, defaults are two players and an empty board
  ##
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1;
    @player_2 = player_2;
    @board = board;
  end

  # => All of the possible winning combinations
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # First column
    [1, 4, 7], # Second column
    [2, 5, 8], # Third Column
    [0, 4, 8], # Left to Right diagonal
    [2, 4, 6]  # Right to Left diagonal
  ];

  ##
  # => Asks how many human players and sets the players up accordingly
  ##
  def define_players
    puts "How many players want to play? (0, 1, or 2)"
    @num_players = gets.strip.to_i

    get_player_input = "Would you like to be 'X's or 'O's?";
    #binding.pry
    case @num_players
      when 0
          @player_1 = Players::Computer.new("X")
          @player_2 = Players::Computer.new("O")
      when 1
        puts get_player_input;
        input = gets.strip;

        input == "O" || input == "o" ? @player_1.token = "O" && @player_2 = Players::Computer.new("X") : @player_2 = Players::Computer.new("O")
      when 2
        puts get_player_input;
        input = gets.strip;
        if input == "O" || input == "o"
          @player_1.token = "O" && @player_2.token = "X"
        end
      else
        puts "Invalid input, please select a valid option.";
        define_players;
      end
  end #end #define_players

  ##
  # => This figures out who's turn it is
  ##
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2;
  end

  ##
  # => This checks if somebody has won the game or not
  ##
  def won?
    WIN_COMBINATIONS.detect { |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    }
    # x = "X";
    # o = "O";
    #
    # WIN_COMBINATIONS.each do |win_combination|
    #   win_index_1 = win_combination[0];
    #   win_index_2 = win_combination[1];
    #   win_index_3 = win_combination[2];
    #
    #   position_1 = @board.cells[win_index_1];
    #   position_2 = @board.cells[win_index_2];
    #   position_3 = @board.cells[win_index_3];
    #
    #   if ((position_1 == x && position_2 == x && position_3 == x) ||
    #     (position_1 == o && position_2 == o && position_3 == o))
    #       return win_combination;
    #     else
    #       false;
    #   end
    # end
    # false; #explicitly tell ruby to return false if we've cycled through the board and no win combinations can be found
  end

  ##
  # => This checks if there is a draw or not
  ##
  def draw?
    @board.full? && !won?;
  end

  ##
  # => This checks if the game has finished in a win or a draw
  ##
  def over?
    won? || draw?;
  end

  ##
  # => This determines who the winner is based on the winning combo
  ##
  def winner
    if won = won?
      board.cells[won.first]
    end
    #won? == false ? nil : @board.cells[winner[0]];
  end

  ##
  # => This handles the taking of turns between the players
  ##
  def turn
    puts "Please enter 1-9:"
    move = current_player.move(@board);
    if @board.valid_move?(move)
      @board.update(move, current_player);
      @board.display;
    else
      turn;
    end
  end

  ##
  # => This initiates the gameplay sequence and announces the winner
  ##
  def play
    until over? do
      turn;
    end

    if won?
      puts "Congratulations #{winner}!";
      replay
    elsif draw?
      puts "Cat's Game!";
      replay
    end
  end

  ##
  # => This welcomes the user(s), defines the players, and starts the game
  ##
  def start
    puts "Welcome to Tic Tac Toe!"
    puts ""
    define_players
    play
  end

  ##
  # => This handles the options for a replay
  ##
  def replay
    @board.reset!
    puts "Would you like to play again?";
    input = STDIN.gets.strip #I need to ask about this method.
    puts ""
    input == "yes" || input == "Yes" ? start : puts("Goodbye!")
  end

end
