class PlayGame
  attr_accessor :game, :player1, :player2

  def start_game
    playing = true

    while playing
      puts "Hello. Let's play tic tac toe"
      puts ""
      player_num = how_many_players

        until player_num.to_i >= 0 || player_num.to_i <= 2 || player_num.downcase == "wargame" do
          player_num = how_many_players
        end

      game_setup(player_num)

      if player_num != "wargame"
        @game.play
        puts " "
      end

      playing = play_again?

    end
  end

  def how_many_players
    puts "How many players?"
    puts "0, 1 or 2"
    gets.strip
  end

  def yes_or_no?(input)
    input == "yes" || input == "y" || input == "no" || input == "n"
  end

  def game_setup(player_num)
    if player_num == "0"
      @player1 = Players::Computer.new("X")
      @player2 = Players::Computer.new("O")
      @game = Game.new(@player1, @player2)
    elsif player_num == "1"
      puts "Would you like to go first?"
      input = gets.strip.downcase
      until yes_or_no?(input) do
        puts "Please answer with 'yes' or 'no'."
        puts " "
        puts "Would you like to go first?"
        input = gets.strip.downcase
      end
      return one_player(input)
    elsif player_num == "wargame"
      wargame
    else
      @game = Game.new
    end
  end

  def one_player(input)
    if input == "yes" || input == "y"
      @player1 = Players::Human.new("X")
      @player2 = Players::Computer.new("O")
      @game = Game.new(@player1, @player2)
    elsif input == "no" || input == "n"
      @player1 = Players::Computer.new("X")
      @player2 = Players::Human.new("O")
      @game = Game.new(@player1, @player2)
    end
  end

  def play_again?
    puts "Would you like to play again?"
    input = gets.strip.downcase
    until yes_or_no?(input) do
      puts "Please answer with 'yes' or 'no'."
      puts ""
      puts "Would you like to play again?"
      input = gets.strip.downcase
    end
    if input == "no" || input == "n"
      false
    elsif input == "yes" || input == "y"
      true
    end
  end

  def wargame
    @player1 = Players::Computer.new("X")
    @player2 = Players::Computer.new("O")
    @game = Game.new(@player1, @player2)
    counter = 0
    times_played = 0
    1000.times do
      @game.play
      counter += @game.winner_counter
      @player1 = Players::Computer.new("X")
      @player2 = Players::Computer.new("O")
      @game = Game.new(@player1, @player2)
      times_played += 1
      # break if counter == 1
    end
    puts "There have been #{counter} wins and #{times_played - counter} draws."
  end
end#class PlayGame
