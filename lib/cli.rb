
class CLI
    def initialize

    end
    def call
            puts "Welcome to Tic Tac Toe!
            Would you like to play a 1 or 2 player game?"
            input = gets.strip
            puts "Player 1 will be X, who would like to go first?"
            input = gets.strip
            Game.new.play
            puts "would you like to play again? Y or N"
            input = gets.strip
            if input == "y" 
            Game.new.play
            if input == "N"
                exit
            end
            end
    end
end