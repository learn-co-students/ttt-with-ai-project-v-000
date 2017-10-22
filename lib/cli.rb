class Cli

  def run
    puts "Welcome to Tic Tac Toe!"
    main_menu
  end

  def main_menu
    puts "How many Human Players(0, 1, or 2)? Type exit at any point to exit the program"
    input = gets.strip
    case(input)
      when "1"
        get_one_player_menu
        play_again?
      when "2"
        get_two_player_menu
        play_again?
      when "0"
        get_zero_player_game
        play_again?
      when "exit"
        exit
      else
        "invalid command"
        main_menu
    end
  end

  def get_zero_player_game
    player_1 = Player::Computer.new("X")
    player_2 = Player::Computer.new("O")
    puts "type 'war' for 50 game war, or play to player one game."
    input = gets.strip
    if input == "war"
      50.times do
        Game.new(player_1, player_2).play
      end
      display_stats
    elsif input == 'play'
      Game.new(player_1, player_2).play
      display_stats
    elsif input == 'exit'
      exit
    else
      puts "invalid input"
      main_menu
    end
  end

  def get_one_player_menu
    puts "Would you like to go first? (y/n)"
    input = gets.strip
    if input == "n"
      player_1 = Player::Computer.new("X")
      player_2 = Player::Human.new("O")
      Game.new(player_1, player_2).play
      display_stats
    elsif input == 'exit'
      exit
    else
      player_1 = Player::Human.new("X")
      player_2 = Player::Computer.new("O")
      Game.new(player_1, player_2).play
      display_stats
    end
  end

  def get_two_player_menu
    Game.new.play
    display_stats
  end

  def play_again?
    puts "Would you like to play again?(y/n)"
    input = gets.strip
    if input == "n"
      exit
    else
      reset_stats?
      main_menu
    end
  end

  def reset_stats?
    puts "Would you like to reset the stats?(y/n)"
    input = gets.strip
    if input == "y"
      Game.reset_stats
    end
  end

  def display_stats
    puts "Player 1 wins: #{Game.stats[:player_1]}"
    puts "Player 2 wins: #{Game.stats[:player_2]}"
    puts "Draws: #{Game.stats[:draws]}"
  end
end
