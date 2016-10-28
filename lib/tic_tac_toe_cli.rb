class TicTacToeCLI

  def call
    system("clear")

    puts "Welcome to Tic Tac Toe"
    puts "How many players?"
    puts ""
    puts "0. Computer vs itself"
    puts "1. One Player vs Computer"
    puts "2. Two players"




      input = gets.strip
      case input
      when "0"
        game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"))
      when "1"
        puts "Would you like to go first? (Yn)"
        answer = gets.strip
        if answer == "y".downcase
          game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O"))
        elsif answer == "n".downcase
          game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Human.new("O"))
        elsif answer == "exit"
          exit
        end
      when "2"
        puts "Player One, please enter you name"
        player_01 = gets.strip
        puts "Welcome #{player_01}!"
        puts "You are player X"
        puts "Player Two plase enter your name"
        player_02 = gets.strip
        puts "Welcome #{player_02}!"
        puts "You are player O"
        game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"))
      when "exit"
        exit
      else
        puts "Invalid Selection! Plaese try again!"
      end
      game.play



    if game.over?
      puts "Would you like to play again? (Yn)"
      option = gets.strip

      case option
      when "y".downcase
        self.call
      when "n".downcase
        puts "So Long and Thanks for All the Fish!"
      when "exit"
        exit
      else
        print "Invalid Selection! Plaese enter Y or N!"
      end
    end
  end

end
