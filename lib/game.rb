require 'pry'

class Game
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    attr_accessor :board, :player_1, :player_2
    attr_reader :current_player
    def initialize(player_1=nil, player_2=nil, board=nil)
        player_1 ? @player_1 = player_1 : @player_1 = Players::Human.new("X")
        player_2 ? @player_2 = player_2 : @player_2 = Players::Human.new("O")
        board ? @board=board :@board = Board.new
        @current_player = @player_1
    end
    def over?
        won? || draw?
    end
    def won?
        res = false
        WIN_COMBINATIONS.each do |combination| #check all the combos
            combo = combination.collect{|index| (index + 1).to_s } # transilate to the plus one with strings just to be sent back again. (why the tests suck)
            if @board.taken?(combo[0]) # thanks insane testing for the off by one errors
                if @board.position(combo[0]) == @board.position(combo[1]) && @board.position(combo[1]) == @board.position(combo[2])
                    res = combination # give us 
                end
            end
        end
        res
    end
    def draw?
        @board.full? && !won?
    end
    def winner
        won? ? @board.position((won?[0] + 1).to_s) : nil
    end

    def turn
        input = "invalid"
        while !@board.valid_move?(input)
            print "\nPlease enter a position from 1 to 9 (Player #{@current_player.token}): "
            input = @current_player.move(@board)
        end
        @board.update(input, @current_player)
        swap_player()
    end

    def bot_turn(index)
        swap_player()
        @board.update((index + 1).to_s, @current_player)
    end

    def swap_player
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while !over?
            puts "\n"
            @board.display()
            turn
        end
        self.draw? ? puts("Cat's Game!") : puts("Congratulations #{winner()}!")
        puts ""
        @board.display()
    end
end
