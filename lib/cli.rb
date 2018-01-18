class Cli

  def start
    puts "*****WELCOME to TIC TAC TOE*****"
    puts "Please select a game mode: \n
          Enter 0 - Computer vs. Computer \n
          Enter 1 - You vs. Computer \n
          Enter 2 - You vs. Another Human" 
    game_mode = gets.strip.to_i

    if game_mode == 0
      game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"))
      game.play
      play_again?
    elsif game_mode == 1
      puts "Would you like to be first player and X? Enter 1 for yes, 2 for no."
      input = gets.strip.to_i
        if input == 1
          game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O"))
          game.play
        else input == 2
          game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Human.new("O"))
          game.play
        end
      play_again?
    else game_mode == 2
      game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"))
      game.play
      play_again?
    end
  end


  def play_again?
    puts "Would you like to play again? Enter 1 for yes, 2 for no."
    input = gets.strip.to_i
      if input == 1
        start
      elsif input == 2
        exit
      else
        put "Please select a valid option...1 for yes, 2 for no"
        play_again?
      end
    end

end
