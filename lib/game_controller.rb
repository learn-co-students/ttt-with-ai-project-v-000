require 'io/console'
class GameController

  def initialize()
    # clear screen
    puts "\e[H\e[2J"

    puts "Welcome to Tic-Tac-Toe!"
    setup_players
    @board = Board.new
    @game = Game.new(@player_1, @player_2, @board)
  end

  def play_game
    @game.play
  end

  private

  def setup_players
    input = nil
    # Until user enters yes or no
    until input =~ /1|2|3/ do
      puts "1. Play against the computer"
      puts "2. Play against a friend"
      puts "3. Computer versus computer"

      input = STDIN.getch
    end
    if input == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    elsif input == "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    elsif input == "3"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    end
  end
end