

class TicTacToeCLI
    attr_accessor :players
    
    def initialize
        @players= []
    end
    
    def begin_game
       welcome
       player_mode
    end

    def welcome
        puts "--" * 20
        puts " Welcome to Tic Tac Toe! ".colorize(color: :white, background: :blue)  
        puts "--" * 20
    end
    
    def player_mode
        input = nil
        while input != "exit"
            puts "Please Enter Player Mode To Begin:"
            puts "  " * 20
            puts "Spectator:"+" 0".green
            puts "You vs Computer:"+" 1".green
            puts "Player vs Player:"+" 2".green
            input = gets.strip
            players = input.to_i
        if players == 0
            Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play 
        elsif players == 1
            players_h_vs_cpu
        elsif players == 2
            players_h_vs_h
        end
            puts "==" * 20
            puts "Play again? Type:"+"(yes) ".blue + "or" + " (exit)".blue
            input = gets.strip
        end
    end
    
    def players_h_vs_cpu
        puts "  " * 20
        puts "You'll be Player 2, 'O'.".green
        puts "==" * 20
           Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
    end
    
    def players_h_vs_h
       puts "Would you like to go first and be 'X'? Y/N"
       input = gets.strip
        if input.upcase == "Y"
           Game.new(Players::Human.new("X"), Players::Human.new("O")).play
        else
            Game.new(Players::Human.new("O"), Players::Human.new("X")).play
        end
    end
    
end