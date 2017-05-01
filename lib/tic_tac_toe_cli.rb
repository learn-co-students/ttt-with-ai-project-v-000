class TicTacToeCLI

  def initialize 
  end

  def call 
    def computer_players
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), Board.new)
      until game.over?
        game.play
      end
      play_again?
    end

    def one_player
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), Board.new)
      until game.over?
        game.play
      end
      play_again?
    end

    def two_player
      game = Game.new
      until game.over?
        game.play
      end
      play_again?
    end


    def start
      input = ""
      puts "Welcome to TIC TAC TOE!! How many players:"
      puts "0 player (computer vs computer)"
      puts "1 player (player vs computer)"
      puts "2 player (player vs player)"
      puts "(please input: 0, 1 or 2)"
      input = gets.strip
        if input == "0"
          computer_players
        elsif input == "1"
          one_player
        elsif input == "2"
          two_player
        else
          puts "Sorry I didn't understand that input"
          start
        end

    end

    def play_again?
      continue = ""
      puts "Would you like to play again?"
      puts "(please input: y/yes or n/no)"
      continue = gets.strip
      if continue == "y" || continue == "yes"
        start
      elsif continue == "n" || continue == "no"
        puts "Thank you.. See you next time!"
      else
        puts "Sorry I didn't understand that input"
        play_again?
      end
    end

    start
  end

end