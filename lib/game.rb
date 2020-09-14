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
        [6,4,2]
    ]
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        self.board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def over?
        self.won? || self.draw?
    end

    def won?
        combination = WIN_COMBINATIONS.collect{ |combo|
            value1 = self.board.cells[combo.first] 
            value2 = self.board.cells[combo[1]]
            value3 = self.board.cells[combo.last]  
            if value1 == " " || value2 == " " || value3 == " "
                false
            elsif value1 == value2 && value2 == value3
                true
            end
        }
        combination.any?{|bool| bool == true}
    end

    def draw?
        self.board.full? && !self.won? 
    end

    def winner
        if won?
            winner = ""
            WIN_COMBINATIONS.each{ |combo|
            value1 = self.board.cells[combo.first] 
            value2 = self.board.cells[combo[1]]
            value3 = self.board.cells[combo.last]  
            if value1 == value2 && value2 == value3 && value1 != " "
                winner = value1
            end
            }
            winner
        else
            nil
        end
    end

    def turn
        input = 0
        again = false
       while (!again)
            puts ""
            puts "Player #{current_player.token}, please enter 1-9:"
            print ":"
            input = self.current_player.move(self.board)
            again = self.board.valid_move?(input)
       end
       self.board.update(input, current_player)
       puts ""
       self.board.display
    end

    def play
        while !self.over?
            self.turn
        end
         if self.draw?
              puts ""
              sleep(0.5)
              puts "Cat\'s Game!"
         else
              puts ""
              sleep(0.5)
              puts "Congratulations #{self.winner}!"
        end
    end
    
end