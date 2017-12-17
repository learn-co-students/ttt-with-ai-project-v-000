require 'io/console'
class GameController

  def initialize()
    # clear screen
    puts "\e[H\e[2J"

    puts "Welcome to Tic-Tac-Toe!"
    @player_1 = Players::Human.new("X")
    @player_2 = if should_make_computer?
      Players::Computer.new("O")
    else
      Players::Human.new("O")
    end
    @board = Board.new
    @game = Game.new(@player_1, @player_2, @board)
  end

  def play_game
    @game.play
  end

  private

  def should_make_computer?
    input = nil
    # Until user enters yes or no
    until input =~ /y(es)?|no?/i do
      puts "Would you like to play against the computer? (y/n)"
      input = STDIN.getch
    end

    input =~ /y(es)?/i
  end

end