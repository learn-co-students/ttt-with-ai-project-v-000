class Game
  attr_accessor :board, :number_of_players, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @plater_2 = player_2
    @board = board
  end

  def setup
    puts "How many players? (1 or 2) \n"
    @number_of_players = get.strip.to_i

    case @number_of_players
      when 1
        puts "You have picked 1 player, you will now play against the computer.\n"
        puts "Would you like to be X's or O's?\n"
        input = gets.strip.to_lower
        if input == "o"
          @player_1.token = "O" && @player_2 = Players::Computer.new("X")
        elsif input == "x"
          @player_1.token = "X" && player_2 = Players::Computer.new("O")
        else
          puts "invalid input, please select a valid one. \n"
          setup
        end

      when 2
        puts "You've picked 2 players, you will now play against eachother.\n"
        puts "Would player 1 like to be X's or O's?\n"
        input = gets.strip.to_lower
        if input == "o"
          @player_1.token = "O" && @player_2.token = "X"
        elsif input == "x"
          @player_1.token = "X" && @player_2.token ="O"
        else
          puts "invalid input, please select a valid one. \n"
          setup
        end

      else
        puts "Your input is invalid. Please try again. \n"
        setup
      end
    end

  end

  def start
    puts "Welcome to Tic Tac Toe!\n"
    setup
    # play
  end

  def replay
    @board.reset!
  end
end
