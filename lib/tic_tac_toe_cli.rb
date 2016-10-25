class TicTacToeCli

  def initialize
  end

  def call
    loop do
      loop do
        puts "Type 'Friend' to play against a friend, 'Terminator' to play against Skynet, and 'Spectate', to watch an epic robot battle."
        input = gets.strip
          if input == 'Friend'
            puts "Who should go first? (X,O)"
            input = gets.strip
            if input == "X"
              Game.new(Players::Human.new("X"), Players::Human.new("O")).play
              break
            elsif input == "O"
              Game.new(Players::Human.new("O"), Players::Human.new("X")).play
              break
            end
          elsif input == "Terminator"
            puts "Do you want to go first? (y,n)"
            input = gets.strip
            if input == "y"
              puts "Pick your token! (X,O)"
              input = gets.strip
              if input == "X"
                Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
                break
              else
                Game.new(Players::Human.new("O"), Players::Computer.new("O")).play
                break
              end
            else
              puts "Pick your token! (X,O)"
              input = gets.strip
              if input == "X"
                Game.new(Players::Computer.new("O"), Players::Human.new("X")).play
                break
              else
                Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
                break
              end
            end
          elsif input == 'Spectate'
            Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
            break
          end
      end
      puts "Would you like to play again? (y/n)"
      input = gets.strip
        if input == "n"
          break
        end
    end
  end
end
