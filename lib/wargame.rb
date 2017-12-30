class Wargame < Game
    attr_accessor :num_rounds, :rounds_played, :x_wins, :o_wins

    def initialize(
        player_1 = Players::Computer.new("X"), 
        player_2 = Players::Computer.new("O"), 
        board = Board.new
    )
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board

        self.reset
        self.num_rounds = 0
    end

    def reset
        super
        self.rounds_played = 0
        self.x_wins = 0
        self.o_wins = 0
    end

    def restart
        self.reset
        self.start
    end

    def play
        while(!self.over?)
            self.turn
        end
        
        if (self.won?)
            puts "WINNER: #{self.winner}"
            if ("X" == self.winner)
                self.x_wins += 1
            else
                self.o_wins += 1
            end
        else
            puts "WINNER: NONE"
        end

        self.rounds_played += 1

        if (self.rounds_played < self.num_rounds)
            self.board.reset!
            self.play
        end
    end

    def start
        system "clear" or system "cls"
        puts "WARGAME SIMULATION MODE ACTIVATED"
        puts ""

        print "How many rounds should the computers play? (1-100): "
        self.num_rounds = gets.chomp.to_i
        while (self.num_rounds < 1 || self.num_rounds > 100)
            print "Please enter a value between 1 and 100: "
            self.num_rounds = gets.chomp.to_i
        end

        puts ""
        puts "...."
        puts "COMMENCING WARGAME SIMULATION"
        puts ""

        self.play

        self.simulation_report
    end

    def simulation_report
        draw_count = self.rounds_played - (self.x_wins + self.o_wins)
        puts ""
        puts "FINAL SIMULATION REPORT:"
        puts "X wins: #{self.x_wins}; X win %: #{100 * (self.x_wins / self.rounds_played)}%"
        puts "O wins: #{self.o_wins}; O win %: #{100 * (self.o_wins / self.rounds_played)}%"
        puts "Draws: #{draw_count}; draws %: #{100 * (draw_count / self.rounds_played)}%"
        puts ""

        self.game_over_menu
    end
end