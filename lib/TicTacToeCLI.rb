class TicTacToeCLI

  def initialize
  end

  def call
    computer_one = Players::Computer.new("X")
    computer_two = Players::Computer.new("O")
    human_one = Players::Human.new("X")

    puts %q[
              ---------   ---------   ---------
              \__   __/   \__   __/   \__   __/
                 | |         | |         | |
                 |_|         |_|         |_|
    ].green
    puts "\nWelcome to Tic Tac Toe!".green
    puts "~~~~~~~~~~~~~~~~~~~~~~~".blue
    puts "How many players? [0 (comp v. comp) || 1 (comp. v. human) || 2 (human v. human) || wargames]"
    player_number = gets.chomp

    if player_number == "0"
      Game.new(computer_one, computer_two).play

    elsif player_number == "1"
      puts "Would you like to take the first turn? [Y/N]"
      input = gets.chomp

      if input == "Y" || input == "y" || input == "Yes" || input == "yes"
        Game.new(human_one, computer_two).play
      elsif input == "N" || input == "n" || input == "No" || input == "no"
        Game.new(computer_one).play
      else
        puts "Invalid entry, please try again."
        start
      end

    elsif player_number == "2"
      Game.new.play

    elsif player_number == "wargames"
      number_of_wins = 0
      number_of_draws = 0

      100.times do
        wargame = Game.new(computer_one, computer_two)
        wargame.play

        if wargame.won?
          number_of_wins += 1
        elsif wargame.draw?
          number_of_draws +=1
        end
      end
      puts "\n#{number_of_wins} wins!\n#{number_of_draws} ties!"


    else
      puts "Invalid entry, please try again."
      start
    end
    replay?
  end

  def replay?
    puts "Would you like to play again? [Y/N]"
    input = gets.chomp
    if input == "Y" || input == "y" || input == "Yes" || input == "yes"
      call
    elsif input == "N" || input == "n" || input == "No" || input == "no"
      exit
    else
      puts "Invalid entry, please try again."
      replay?
    end
  end
end
