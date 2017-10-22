
class CLI
    def initialize

    end
    def call
            puts "Welcome to Tic Tac Toe!
            How many players do you have? 0, 1 or 2"
            input = gets.strip.to_i
            if input == 0
                puts " Computer vs Computer"
                Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board = Board.new ).play
               
            elsif input == 1
                puts "One player vs Computer"
                puts "Should player 1 (X) go first or Player 2 (O)?"
                Game.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new ).play
            
            elsif input == 2
                puts "2 Player Game"
                puts "Should player 1 (X) go first or Player 2 (O)?"
                Game.new(Players::Human.new("X"), Players::Human.new("O"), board = Board.new ).play
                
     end
            puts "Would you like to play again? Y or N"
            input = gets.strip
            if input == "y"
                call
            if input == "n"
                exit
            end
        end
        
    end
end