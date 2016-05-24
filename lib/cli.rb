class CLI
  def call
    setup_game
  end

  def setup_game
    puts "Would you like to play a game of Tic Tac Toe or wargames or nothing? (t/w/n)"
    input = gets.strip
    if input == "t"
      puts "How many players? (0, 1, 2)"
      input = gets.strip
      if input == "0"
        game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      elsif input == "1"
        game = Game.new(Player::Human.new("X"), Player::Computer.new("O"))
      elsif input == "2"
        game = Game.new(Player::Human.new("X"), Player::Human.new("O"))
      else
        puts "Sorry, invalid input."
      end
      game.play
    elsif input == "w"
      wins = 0
      100.times do
        game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
        end_message = game.play
        wins += 1 if game.won?
      end
      puts "Wargames wins: #{wins}"
    elsif input == "n"
      puts "Thank you and have a nice day!"
    else
      puts "Invalid input. Please re-enter."
      setup_game
    end
  end
end