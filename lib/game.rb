class Game
    
    attr_accessor :player_1, :player_2, :board, :computer, :game

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
            board.taken?(win_combination[0] + 1) 
        end
    end

    def draw?
        @board.full? && !won?
    end

    def winner
        if win_combination = won?
            board.cells[win_combination[0]]
        end
    end

    def turn
        current_turn = current_player.move(@board)
        if @board.valid_move?(current_turn)
            @board.update(current_turn, current_player) 
        else
            turn
        end
    end

    def play
        board.display        
        while !over?
            turn
            board.display
        end
            if draw?
                puts "Cat's Game!"
            elsif won?
                puts "Congratulations #{winner}!"                 
            end
        board.display
    end
end