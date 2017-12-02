require 'pry'

class Game
    
    attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.cells.count{|cell| cell != " "} % 2 == 0 ? @player_1 : @player_2
    end

    def over?
        draw? || won?
    end

    def won?
        WIN_COMBINATIONS.find do |win_combination| 
            board.cells[win_combination[0]] == board.cells[win_combination[1]] && 
            board.cells[win_combination[1]] == board.cells[win_combination[2]] && 
            board.taken?(win_combination[0])
        end
    end

    def draw?
        @board.full? && !won?
    end

    def winner
         # board.cells[won?.first] if won? #this also works because won?.first represents the first play
        if win_combination = won?
            board.cells[win_combination[0]]
        end
    end

    def turn
        current_turn = current_player.move(@board)
        if @board.valid_move?(current_turn) #turn chcks if valid move runs itself ... can check if it's valid and do the turn at the same time
            @board.update(current_turn, current_player) #Notes: use @board and not board because @ is more object oriented #Notes: note how this reads like sentences
            #can't typically pass a method but you can if you use a VARIABLE
            #recursion is clling a method within itself
            
        else
            turn
        end
    end

    def play  
        while !over?
            turn
        end
            if draw?
                puts "Cat's Game!"
            elsif won? && #???
                puts "Congratulations X!" 
            elsif won? && #???
                puts "Congratulations O!" 
            end
    end
end

#require_all './lib'

#all of the following in the bin file for the app will open pry for all files

#!/usr/bin/env ruby

# require_relative '../config/environment'

# require 'pry'

# Pry.start
