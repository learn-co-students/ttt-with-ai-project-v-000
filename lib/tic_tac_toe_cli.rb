class TicTacToeCLI

  def initialize
  end

  def call
    keep_playing = true

    while keep_playing do
      puts "Welcome to Tic-Tac-Toe!"
      puts "How many humans will be playing? Enter 0, 1, or 2:"
      input = gets.chomp
      puts "A #{input} player game? Great. Let's start."
      case input
        when "0"
          player_1 = Players::Computer.new("X")
          player_2 = Players::Computer.new("O")
          game = Game.new(player_1, player_2)
          game.start
        when "1"
          valid_input_received = false
          while !(valid_input_received) do
            puts "X goes first. Should the human player be X? Otherwise, the computer will have first move. (Y/N)"
            player_choice = gets.chomp
            if (player_choice == "Y") || (player_choice == "y") then
              player_1 = Players::Human.new("X")
              player_2 = Players::Computer.new("O")
              valid_input_received = true
            elsif (player_choice == "N") || (player_choice == "n") then
              player_1 = Players::Computer.new("X")
              player_2 = Players::Human.new("O")
              valid_input_received = true
            else
              puts "That choice is not valid. Please try again."
            end
          end
          game = Game.new(player_1, player_2)
          game.start
        when "2"
          game = Game.new()
          game.start
        when "wargames"
          counter = 0
          x_score = 0
          o_score = 0
          draws = 0
          wargames_protocol = true
          puts "I want to play thermonuclear war ..."
          while counter < 100 do
            player_1 = Players::Computer.new("X")
            player_2 = Players::Computer.new("O")
            game = Game.new(player_1, player_2)
            winplayer = game.start
            case winplayer
              when "X"
                x_score = x_score + 1
              when "O"
                o_score = o_score + 1
              when "draw"
                draws = draws + 1
            end
            counter = counter + 1
          end
          puts "Wargames protocol complete"
          puts "X victories: #{x_score}"
          puts "O victories: #{o_score}"
          puts "Tied games: #{draws}"
          puts "A strange game. The only winning move is not to play."
      end
      #game.start
      puts "Good game!"
      play_again_choice_valid = false
      while !(play_again_choice_valid) do
        puts "Play again? (Y/N)"
        play_again_choice = gets.chomp
        if (play_again_choice == "Y") || (play_again_choice == "y") then
          puts "Restarting..."
          play_again_choice_valid = true
        elsif (play_again_choice == "N") || (play_again_choice == "n") then
          puts "Thanks for playing Tic-Tac-Toe!"
          keep_playing = false
          play_again_choice_valid = true
        else
          puts "Invalid choice. Choose again."
        end #if (play_again_choice == "Y") || (play_again_choice == "y") then
      end #while !(play_again_choice_valid) do
    end #while keep_playing do
  end #def call
end
