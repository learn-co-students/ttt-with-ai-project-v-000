require 'io/console'
class GameController

  def initialize(clear_screen: true)
    # clear screen
    puts "\e[H\e[2J" if clear_screen

    puts "Welcome to Tic-Tac-Toe!"
    setup_players
    @board = Board.new
    @game = Game.new(@player_1, @player_2, @board)
  end

  def play_game
    @game.play
    puts "*"*18
    GameController.new(clear_screen: false)
  end

  private

  def setup_players
    input = nil
    # Until user enters yes or no
    until input =~ /1|2|3|x/ do
      puts "1. Play against the computer"
      puts "2. Play against a friend"
      puts "3. Computer versus computer"
      puts "x. Exit"

      input = STDIN.getch
    end

    case input
    when "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    when "3"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    when "x"
      puts "Let's play again later!"
      Kernel.exit
    end
  end
end