class CLI
    def call
        puts "Welcome to Tic Tac Toe!"
        puts "Enter 1 to play against another human."
        puts "Enter 2 to play against the computer."
        puts "Enter 3 or wargames to pit two computer players against each other."

        game_mode = gets.strip
        token = ""

        while !game_mode.to_i.between?(1, 3) && game_mode != "wargames"
            puts "I don't recognize that. Please enter 1, 2, 3, or wargames."
            game_mode = gets.strip
        end

        case
            when game_mode == "1" #human vs human
                puts "X goes first! Are you ready?"
                game = Game.new
                game.play
                
            when game_mode == "2" #human vs AI
                puts "X or O?"
                token = gets.strip.upcase
                
                while token != "X" && token != "O"
                    puts "I don't recognize that. Please enter X or O."
                    token = gets.strip.upcase
                end
                
                game = nil
                if token == "X" 
                    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
                else
                    game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
                end
                game.play
                
            when game_mode == "3" #AI vs AI
                puts "Get ready to watch the battle unfold!"
                game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
                game.play
                
            when game_mode = "wargames"
                game_count = 0
                won_count = 0
                while game_count < 100
                    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
                    outcome = game.play
                    if outcome != nil
                        won_count += 1
                    end
                    game_count += 1
                end
                puts ""
                puts "Wargames complete!"
                puts "#{won_count} out of 100 games had a winner."
        end
    end
end