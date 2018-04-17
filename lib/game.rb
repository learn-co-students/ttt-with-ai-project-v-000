require 'pry'
require_relative 'board.rb'

class Game
  attr_accessor :board, :player_1, :player_2
 WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end


  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0] + 1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board.cells[won?.first]
    end
  end

  def turn
    # puts "Please enter 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      puts "Invalid."
      turn
    end
  end

  def play
    until over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
    replay
  end

  #set up the new Game
  def start
      puts "Welcome to Tic Tac Toe!"
      puts "Select the type of game you'd like to play:"
      puts "0 - Computer vs Computer"
      puts "1 - Human vs Computer"
      puts "2 - Human vs Human"

      input = gets.strip

        if input == "0"
          this_game = Game.new(player_1 = Players::Computer.new("X"),
          player_2 = Players::Computer.new("O"), board = Board.new)
          this_game.play

        elsif input == "1"
          puts "The first player will be 'X', the human player"
          this_game = Game.new(player_1 = Players::Human.new("X"),
            player_2 = Players::Computer.new("O"), board = Board.new)
          this_game.play


        elsif input == "2"
          puts "Human player 1 will be 'X', player 2 will be 'O'"
          this_game = Game.new(player_1 = Players::Human.new("X"),
            player_2 = Players::Human.new("O"), board = Board.new)
          this_game.play

        end
      end

      def replay
        puts "Would you like to play another game? Enter 'y' for yes
        or 'n' for no:"
        input = gets.strip

        if input == "y"
          start
        else
          exit
        end
      end

end
