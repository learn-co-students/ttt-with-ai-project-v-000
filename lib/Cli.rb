#require 'pry'
class Cli
  attr_accessor :game, :player_1, :player_2, :kind_of_game

  def trigger
    start_game
    game = Game.new(@player_1, @player_2)
    game.play
    restart if game.over?
  end

  def start_game
    play_mode_display
  end

  def play_mode_display
    puts "What kind of game you want to play? 0,1,2"
    puts "0 : AI 1 vs AI 2"
    puts "1 : player vs AI"
    puts "2 : player 1 vs player 2"
    print "Choose one : "
    @kind_of_game = gets.chomp
    choose_game(@kind_of_game)
  end

  def choose_game(input)
    case input
      when "0"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")
      when "1"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
      when  "2"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Human.new("O")
      else
        puts "You've wrote wrong number. Choose 0,1,2"
        play_mode_display
    end
  end

  def restart
    print "Would you like to play game again? (Y,N) : "
    ans = gets.chomp.upcase
    if ans == "Y"
      self.trigger
    elsif ans == "N"
      puts "Thank you!\nBye."
    else
      print "What do you mean? Please answer with Y or N."
      restart
    end
  end
end
