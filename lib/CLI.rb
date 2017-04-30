class Cli


  def start_game
    puts "Welcome to Tic-Tac-Toe!"
    sleep 1.5
    puts "What kind of game would you like to play: 0, 1 or 2 players?"
    sleep 1.5
    puts "0 : this game has two computer players AI, playing against."
    sleep 1.5
    puts "1 : this game has a human playing against a computer AI."
    sleep 1.5
    puts "2 : this game has two human players."
    game_type = gets.chomp

    case game_type
    when "0"
      puts "This is gonna be interesting! Let's see if I can beat myself."
      sleep 1.5
      games_counter = 0
      x_winning = 0
      o_winning = 0
      draw = 0

      while games_counter <= 100
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play
        draw += 1 if game.draw?
        x_winning += 1 if game.winner == "X"
        o_winning += 1 if game.winner == "O"
        games_counter += 1
        game.board.reset!
        sleep(2)
       end
    puts "X won: #{x_winning} time(s), O won: #{o_winning} time(s) and total draws: #{draw}"

    when "1"
      puts "X is the first player. Would you like to go first?[y/n]"
      input = gets.strip
      if input.downcase == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif input.downcase == "n"
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      else
        puts "Wrong input. Type 'y' for yes or 'n' for no"
        input
      end
    when "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    else
      puts "Invalid input! Try again. Choose 0, 1 or 2."
      start_game
    end
  end


end
