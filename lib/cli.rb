class Cli
  def start
  
      game_input = ""
      until game_input == "0" || game_input == "1" || game_input == "2"
        puts "Please select a game type, 1: single player, Press 2: multiplayer, Press 3: war"
        game_input = $stdin.gets.strip
      end

      player_1 = " "
      until player_1 == "X" || player_1 ==  "O"
      puts "Select X or O for your token."
       player_1 = $stdin.gets.strip
     end

     if player_1 == "O"
          player_2 = "X" ; player_1 = "O"
       elsif player_1 == "X"
         player_2 = "O" ; player_1 = "X"
     end

    case game_input

      when "0"
       game = Game.new(Players::Computer.new(player_1), Players::Computer.new(player_2)).play
      when "1"
        game = Game.new(Players::Human.new(player_1), Players::Computer.new(player_2)).play
      when "2"
          game = Game.new(Players::Human.new(player_1), Players::Human.new(player_2)).play
      
    end

    def end_game
      puts "Game is over. Would you like to play again? Y/N"
       input = gets.chomp
       case input
         when "Y"
           start
         when "N"
           puts "Goodbye."
           exit
         end
    end
  end
end