class TicTacToeCLI
    attr_accessor :players
    
    def initialize
        @players = []
    end
    
    def setup_game
        self.greeting
        self.select_mode
    end
    
    def greeting
        # Greet the user with a message.
        puts "=" * 40
        puts "Welcome to the Tic Tac Toe!"
        puts "=" * 40
    end
    
    def select_mode
        response = nil        
        while response != 'exit'
            # Prompt the user for what kind of game they want to play, 0, 1, or 2 player.
            puts "How many Players will there be? 0, 1, or 2: "
            player_count = gets.chomp
                
            case player_count
            when "0"
                self.cpu_vs_cpu_options
            when "1"
               self.one_player_options
            when "2"
                self.new_game
            end
            self.reset
            puts "Would you like to play again? Type (yes) or (exit): "
            response = gets.chomp
        end
    end
    
    def new_game
        if players.empty?
            game = Game.new
            game.start_game
        else
            game = Game.new(self.players[0], self.players[1])
            game.start_game
        end
    end
    
    def one_player_options
        first = nil
        loop do
            puts "Do you want to go first? (y)es or (n)o "
            first = gets.chop.downcase
            break if first == "y" || first == "n" || first == "yes" || first == "no"
        end
        
        if first == "y"
            self.players << Players::Human.new("X")
            self.players << Players::Computer.new("O")
            players[1].player_number = 2
        else
            self.players << Players::Computer.new("X")
            self.players << Players::Human.new("O")
            players[0].player_number = 1
        end
        self.new_game
    end
    
    def cpu_vs_cpu_options
        self.players << Players::Computer.new("X")
        self.players << Players::Computer.new("O")
        self.players[0].player_number = 1
        self.players[1].player_number = 2
        new_game
    end
    
    def reset
        self.players.clear
    end
    
end