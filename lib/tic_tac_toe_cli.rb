class TicTacToeCLI

  def initialize
  end

  def call

    puts "Welcome to Tic Tac Toe!"
    puts "Would you like to play a 0, 1 or 2 player game?"
    puts "Enter 0 to watch the AI play."
    puts "Enter 1 to play against the computer."
    puts "Enter 2 to play a two-player game."


    players = " "

    players = gets.strip.to_i

    case players


      when 0
        puts "2 Computers Playing"
        game = Game.new(player_1 = Players::Computer.new("X"),player_2 = Players::Computer.new("O"))
        game.play

      when 1
        puts "1 Human and 1 Computer Playing"
        game = Game.new(player_1 = Players::Human.new("X"),player_2 = Players::Computer.new("O"))
        game.play


      when 2
        puts "2 Humans Playing"
        game = Game.new
        game.play


        play_again = " "

        until play_again.downcase == "n" || play_again.downcase == "no"
          puts "Would you like to play again? Enter yes / no"
          play_again = gets.strip

          if play_again.downcase == "y" || play_again.downcase == "yes"
            game = Game.new
            until game.won?
              game.play
            end
          end

        end
      end #--end case
  end
end


