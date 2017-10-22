class TTTCLI #command line interface

    def initialize
        puts "Welcome to Tic Tac Toe! "
        input = "yes"
        while input == "yes"
            start
            puts "Would you like to play again? (Yes/No)"
            input = gets.strip.downcase
        end
            puts "Hope you had a good time playing!"
    end

    def start
        puts "What kind of game you would like to play? 0, 1 or 2 players?"
        puts "Type 0 if you want to see a Computer vs. Computer game."
        puts "Type 1 if you want to play against the Computer."
        puts "Type 2 if you want to play a 2-player game."
        input = gets.strip
        if input == "0"
            player_1 = Players::Computer.new("X")
            player_2 = Players::Computer.new("O")
            new_game = Game.new(player_1, player_2, board = Board.new)
            new_game.board.display
            new_game.play
        elsif input == "1"
            puts "You are player 1: 'X' and I will be player 2: 'O'."
            new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new)
            new_game.board.display
            puts "Enter a number!"
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