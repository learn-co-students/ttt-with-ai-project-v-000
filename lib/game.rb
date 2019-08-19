class Game
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    attr_accessor :board, :player_1, :player_2

    def initialize(
        player_1 = Players::Human.new("X"), 
        player_2 = Players::Human.new("O"), 
        board = Board.new
    )
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end

    def reset
        self.board.reset!
    end

    def restart
        self.reset
        self.play
        if (Players::Human == player_1.class)
            self.game_over_menu
        end
    end

    def current_player
        0 == board.turn_count % 2 ? player_1 : player_2
    end

    def over?
        self.draw? || self.won?
    end

    def won?
        cells = board.cells
        WIN_COMBINATIONS.detect do |win_combo|
            (cells[win_combo[0]] == "X" || cells[win_combo[0]] == "O") &&
            cells[win_combo[0]] == cells[win_combo[1]] &&
            cells[win_combo[1]] == cells[win_combo[2]]
        end
    end

    def draw?
        board.full? ? !self.won? : false
    end

    def winner
        win_combo = self.won?
        board.cells[win_combo[0]] if win_combo
    end

    def turn
        player_move = current_player.move(self.board, self)
        while (!board.valid_move?(player_move))
            player_move = current_player.move(self.board, self)
        end
        board.update(player_move, current_player)
    end

    def play
        while(!self.over?)
            self.turn
        end
        
        if (self.won?)
            puts ""
            puts "******************"
            puts "Congratulations #{self.winner}!"
            puts "******************"
            puts ""
        else
            puts ""
            puts "Cat's Game!"
            puts ""
        end
    end

    def start
        system "clear" or system "cls"
        puts "THE PLAYERS INTRODUCE THEMSELVES!"
        puts ""

        if (Players::Human == player_1.class)
            print "Player 1, enter your name: "
            self..player_1.name = gets.chomp
            puts ""
            puts "You will be playing the X pieces, #{self.player_1.name}"
            puts "Good luck!"
            puts ""
        else 
            self.player_1.name = (Players::Computer::COMPUTER_NAMES).sample
            puts "#{self.player_1.name} will be playing the X pieces!"
        end

        if (Players::Human == player_2.class)
            print "Player 2, enter your name: "
            self.player_2.name = gets.chomp
            puts "You will be playing the O pieces, #{self.player_2.name}"
            puts "Good luck!"
            puts ""
        else
            self.player_2.name = (Players::Computer::COMPUTER_NAMES).sample
            puts "#{self.player_2.name} will be playing the O pieces!"
            puts ""
        end

        puts "LET'S GET READY TO RUMBLE!!!"
        puts ""
        puts ""

        self.restart
    end

    def game_over_menu
        print "Would you like to PLAY this mode again, exit to the main MENU, or QUIT the game? "
        player_choice = gets.chomp
        if (player_choice.upcase.eql?("PLAY"))
            system "clear" or system "cls"
            self.restart
        elsif (player_choice.upcase.eql?("QUIT"))
            puts ""
            puts "....."
            puts "...Oh. Ok....Well, bye. It was nice playing with you."
            puts ""
            exit
        elsif (!player_choice.upcase.eql?("MENU"))
            puts ""
            puts "....."
            puts "Let's try that again..."
            self.game_over_menu
        end
    end
end