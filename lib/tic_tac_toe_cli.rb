class TicTacToeCLI
  def call
    puts "Welcome to Tic-Tac-Toe!"

    while true
      puts "\nHow many players? (0, 1, 2, or 'quit' to exit)"
      case gets.chomp
      when "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      when "1"
        while true
          puts "Would you like to go first and be 'X'? (y/n)"
          case gets.chomp
          when "y"
            Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
            break
          when "n"
            Game.new(Players::Computer.new("X")).play
            break
          else
            puts "I did not understand. Please answer either 'y' or 'n'"
          end
        end
      when "2"
        Game.new.play
      when "wargames"
        25.times do
          Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
          sleep(0.2)
        end
        puts "A strange game. The only winning move is not to play."
        puts "How about a nice game of chess?"
        break
      when "chess"
        puts "This feature is not yet implemented."
        puts "How about a nice game of Tic-Tac-Toe?"
      when "global thermonuclear war"
        puts "I think you have me confused with someone else."
      when "q", "quit", "exit"
        break
      else
        puts "I did not understand."
      end
    end
  end
end
