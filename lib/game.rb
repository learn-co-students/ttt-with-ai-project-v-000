require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2, :error, :x_wins, :o_wins

    # Define your WIN_COMBINATIONS constant
    WIN_COMBINATIONS = [
        [0,1,2], #top
        [3,4,5], #Middle
        [6,7,8], #last
        [0,3,6], #left
        [1,4,7], #center
        [2,5,8], #right
        [0,4,8], #backslash
        [6,4,2] #forward slash
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        @error = 0
        @x_wins = 0
        @o_wins = 0
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end

    def over?
        if draw? || won?
            true
        else
            false
        end
    end

    def draw?
        self.board.full? && !self.won?

    end

    def won?
       WIN_COMBINATIONS.each do |combination|
            a = combination.collect { |index| self.board.cells[index] }
            if a.all?{ |a| a=="X"} 
                return "X"
            elsif a.all?{ |a| a=="O"}
               return "O"
            end
        end
        nil
    end

    def winner
        self.won?
    end

    def turn
        input = self.current_player.move(self.board)
        if self.board.valid_move?(input) 
            self.board.update(input, self.current_player)
        elsif self.error < 5
            puts "Invalid move: #{input} #{error}."
            self.error += 1
            self.turn
        end
    end

    def play
        while !self.over?
            self.turn
        end

        self.won? ? (puts "Congratulations #{won?}!") : (puts "Cats Game!")
    end

    def start
        input = ""
        until input == "n" do
            self.play
            self.board.reset!
            puts "Play again (y/n?)"
            input = gets.chomp
        end
    end
 end