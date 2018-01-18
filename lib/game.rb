require_relative '../config/environment'
require 'pry'

class Game
    
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
                        [0,3,6], [1,4,7], [2,5,8], 
                        [0,4,8], [2,4,6]]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1=Players::Human.new("X"), 
        player_2=Players::Human.new("O"), board=Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def start

    end

    def play
        until over? == true
            self.turn
        end
        if over? == true
            if won?
                puts "Congratulations #{self.winner}!"
            elsif draw?
                puts "Cat's Game!"
            end
        end
    end

    def turn
        input = self.current_player.move(@board)
        if !@board.valid_move?(input)
            print "That was not a valid move. "
            self.turn
        end
        @board.update(input, self.current_player)
        @board.display
    end

    def current_player
        turn_count = @board.turn_count
        turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            cell1 = board.cells[combo[0]]
            cell2 = board.cells[combo[1]]
            cell3 = board.cells[combo[2]]
            if cell1 == cell2 && cell2 == cell3 && cell1 != " "
                return combo
            end
        end
        false
    end

    def over?
        !!(self.won? || self.draw?)
    end

    def draw?
        board.full? && !self.won?
    end

    def winner
        if self.won? != false
            board.cells[self.won?[0]]
        else
            nil
        end
    end

end
