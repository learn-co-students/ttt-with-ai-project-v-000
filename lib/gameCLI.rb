class GameCLI

def start
  input = ""
  while input != "exit"
    puts "Welcome to Tic Tac Toe!"
    puts "What kind of game would you like to play? Enter '0 player', '1 player', or '2 player'."


      input = gets.strip

      case input

      when input == "0 player"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play

      when input == "1 player"
        puts "Would you like to go first? Enter 'yes' or 'no'."
        if input == "yes"
          Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
        else Game.new(Players::Computer.new("O"), Players::Human.new("X"), Board.new).play
            end

      when input == "2 player"
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
        end

        puts "Would you like to play again? If not enter 'exit'."

    game_start until input == "exit"

end
