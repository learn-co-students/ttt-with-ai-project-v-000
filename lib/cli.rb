class CLI
    
    def initialize
    end

    def call
        puts "Welcome. How many players (0, 1, or 2)?"
        players = gets.chomp
        case players
            when "0"
                new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
                new_game.start

            when "1"
                puts "Would you like to be X or O?"
                input = gets.chomp
                if input == "X"
                    new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
                    new_game.start
                elsif input == "O"
                    new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
                    new_game.start
                end

            when "2"
                new_game = Game.new
                new_game.start

            when "wargames"
                games_played = 0
                new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
                100.times do |round|
                    new_game.play
                    winner = new_game.won?
                    if winner == "X"
                        new_game.x_wins += 1
                    elsif winner == "O"
                        new_game.o_wins += 1 
                    end
                    games_played += 1
                    new_game.board.reset!
                end
                puts "Results of #{games_played} games: X Wins - #{new_game.x_wins}, O Wins = #{new_game.o_wins}"
            
        end
    end
end
