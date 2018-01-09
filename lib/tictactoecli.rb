class TicTacToeCLI
    
    def begin_game
       welcome
       player_mode
    end

    def welcome
        puts "--" * 20
        puts "Welcome to Tic Tac Toe!"  
        puts "--" * 20
    end
    
    def player_mode
        input = nil
        while input != 'exit'
            puts "Would you like to play 0, 1, or 2 player?"
            input = gets.strip
            players = input.to_i
        if players == 0
            Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play  
        elsif players == 1
            Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        else
            Game.new.play
        end
        puts "Play again? (yes) or (exit)"
        input = gets.strip
        end
    end
    
end