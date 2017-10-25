require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def over?
        board.full? || draw? || won?
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            mapped_cells = win_combo.map {|i| board.cells[i]}
            if mapped_cells.count(mapped_cells.first) == 3 && mapped_cells.first != ' '
                win_combo
            else
                false
            end
        end
    end

    def draw?
        board.full? && !won?
    end

    def winner
        if win_combo = won?
            board.cells[win_combo.first]
        end
    end

    def turn
        input = current_player.move(board)
        until board.valid_move?(input)
            input = current_player.move(board)
        end
        board.update(input, current_player)
    end

    def choose_game_type
        puts "What kind of game do you want to play?"
        puts "1.  2-player"
        puts "2.  1-player"
        puts "3.  0-player"
        puts "4.  Wargames (multiple 0 player games)"
        game_type = gets.chomp
        if game_type.to_i.to_s != game_type || game_type.to_i < 1 || game_type.to_i > 4
            choose_game_type
        else
            game_type
        end
    end

    def wargames num_times
        num_o_wins = 0
        num_x_wins = 0
        num_ties = 0

        num_times.times do
            #we are given computer players in #start

            #need to reset board
            self.board.reset!

            until over?
                turn
            end

            if won?
                if winner == 'O'
                    num_o_wins += 1
                else
                    num_x_wins += 1
                end
            else
                num_ties += 1
            end
        end

        puts "X won #{num_x_wins} times"
        puts "O won #{num_o_wins} times"
        puts "The game tied #{num_ties} times"
    end

    def play
        until over?
            turn
        end

        board.display
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

    def start
        puts "Welcome to Tic Tac Toe!"
        type_chosen = choose_game_type
        goes_first = nil

        #sets players based on input
        if type_chosen == "1"
            self.player_1 = Players::Human.new("X")
            self.player_2 = Players::Human.new("O")
        elsif type_chosen == "2"
            while goes_first != "1" && goes_first != "2" do
                puts "Who should go first?"
                puts "1.  Human (you!)"
                puts "2.  Computer"
                goes_first = gets.chomp
            end
            if goes_first == "1"
                self.player_1 = Players::Human.new("X")
                self.player_2 = Players::Computer.new("O")
            else
                self.player_1 = Players::Computer.new("X")
                self.player_2 = Players::Human.new("O")
            end
        else #must be a computer-computer game since we validated in #choose_game_type
            self.player_1 = Players::Computer.new("X")
            self.player_2 = Players::Computer.new("O")
        end

        #updated to allow for wargames mode
        if type_chosen == "4"
            num_games = nil
            until num_games == num_games.to_i.to_s && num_games.to_i > 0
                puts "How many games do you want the computer to play?"
                num_games = gets.chomp
            end
            wargames(num_games.to_i)
        else
            play
        end
    end

end
