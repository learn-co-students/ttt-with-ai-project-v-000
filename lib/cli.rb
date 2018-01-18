class CLI

  def call
    puts "Hello welcome to Masters of Tic-Tac-Toe"

    puts "Would you like to play? (yes / no)"
    input = gets.chomp

    while input == "yes"
      puts "How many players are there? (0-2)"

      player = gets.chomp

      case player

      when "0"
        puts "Two AI players battle it out"
        new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        new_game.play

      when "1"
        puts "Test your might against the AI"
        puts "Would you like to go first or second, please enter 1 or 2"
        input = gets.chomp

        if input == "1"
          new_game = Game.new(Players::Human.new("X"),Players::Computer.new("O"))
          puts "Please enter your first move"
          new_game.play
        elsif input == "2"
          new_game = Game.new(Players::Computer.new("X"))
          new_game.play
        end

      when "2"
        new_game = Game.new
        puts "Please enter your first move"
        new_game.play

      else
        puts "Please input valid number of players (0-2)"
        input = gets.chomp
      end

      puts "Would you like to play again? (yes/no)"
      input = gets.chomp
    end
  end
end
