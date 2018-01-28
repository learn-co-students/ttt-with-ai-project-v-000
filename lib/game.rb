require 'pry'
require_relative './players/computer.rb'
class Game
    
    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
        @player_1 = p1
        @player_2 = p2
        @board = board
    end
    
    def current_player
        self.board.turn_count.even? || self.board.turn_count == 0 ? self.player_1 : self.player_2
    end
    
    def over?
        self.won? != false || self.draw? == true
    end
    
    def won?
        WIN_COMBINATIONS.each do |win_combination|
            if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" &&      self.board.cells[win_combination[2]] == "X" || self.board.cells[win_combination[0]] == "O" &&      self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
            return win_combination
            end
        end
        return false
    end
    
    def draw?
        self.won? == false && self.board.full? == true
    end
    
    def winner
        self.won? != false ? self.board.cells[self.won?[0]] : nil
    end
    
    def turn
        self.board.display
#        binding.pry
        if self.current_player.instance_of?(Players::Computer) == true
            puts "It's the Computer's move..."
            board = self.board
            input = self.current_player.move(board)
            if self.board.valid_move?(input) == false
                puts "Invalid move."
                turn
            elsif self.board.valid_move?(input) == true
                self.board.update(input, self.current_player)
            end
            sleep(2)
        else
            input = self.current_player.move(input)
            if self.board.valid_move?(input) == false
                turn
            end
            if self.board.valid_move?(input) == true
                self.board.update(input, self.current_player)
            end
        end
    end
    
    def play
        until self.over? == true
            self.turn
        end
        self.board.display
        puts "Congratulations #{self.winner}!" if self.won? != false
        puts "Cat's Game!" if self.draw? == true
    end
    
    def self.start
        puts "Welcome to mother-fucking Tic-Tac-Toe!"

        puts "Would you like to play a 0, 1, or 2 player game?"

        user_input = gets.strip
        p1 = nil
        p2 = nil
        board = Board.new
        
        if user_input == "2"
            puts "Who wants to go first and be X? Player 1, reply with 'me'."
            user_input2 = gets.strip
            p1 = Players::Human.new("X")
            p2 = Players::Human.new("O")
        elsif user_input == "1"
            puts "Do you want to go first (and be X) or do you want the computer to go first?"
            user_input2 = gets.strip
            if user_input2 == "computer" 
                p1 = Players::Computer.new("X")
                p2 = Players::Human.new("O")
            else
                p1 = Players::Human.new("X")
                p2 = Players::Computer.new("O")
            end
        elsif user_input == "0"
            p1 = Players::Computer.new("X")
            p2 = Players::Computer.new("O")
        end

        Game.new(p1, p2, board).play
        
     end
    
    def self.restart
        loop do
            puts "Would you like to play again?"
            user_input3 = gets.strip
            if user_input3 == "yes" || user_input3 == "Yes"
                self.start
            elsif user_input3 == "no" || user_input3 == "No"
                exit
            end
        end
    end
    
end