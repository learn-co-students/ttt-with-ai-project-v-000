class TTTCLI

    def initialize
        puts "Welcome to Tic Tac Toe! "
        game = "yes"
        while game == "yes"
            start
            puts "Would you like to play again? (Y/N)"
            game = gets.strip.downcase
            puts ' '
        end
            puts "Hope you had a good time playing!"
            puts ' '
    end

    def start
        puts "What kind of game you would like to play? 0, 1 or 2 players?"
        puts "Type 0 if you want to see a Computer vs. Computer game."
        puts "Type 1 if you want to play against the Computer."
        puts "Type 2 if you want to play a 2-player game."
        input = gets.strip
        if input == "0"
            new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
            puts "Carry on!"
            new_game.board.display
            new_game.play
        elsif input == "1"
            puts "You are player 1: 'X' and I will be player 2: 'O'."
            new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
            puts "To Battle!"
            new_game.board.display
            new_game.play
        elsif input == "2"
            puts "Player 1: 'X' and player 2: 'O'."
            new_game = Game.new
            puts "Let's go!"
            new_game.board.display
            new_game.play
        end
    end
    
end