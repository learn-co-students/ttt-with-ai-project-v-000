class TicTacToeCLI

  def initialize
  end

  def call

    puts "Welcome to Tic Tac Toe!"

    puts "What Kind of Game Do You Want to Play?  0, 1, or 2 Player(s)"

    puts "Enter Number of Player(s):"


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
        until play_again == "N"
          puts "To stop play enter N, otherwise enter Y to keep playing!"
          play_again = gets.strip

          if play_again == "Y"
            game = Game.new
            game.play
          end

        end
      end
    end
  end
