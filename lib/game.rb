class Game
    attr_accessor :player_1, :player_2, :board
    WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle
    [6,7,8], #bottom
    [0,3,6], #left down
    [1,4,7], #middle down
    [2,5,8], #right down
    [0,4,8], # diagonal down
    [6,4,2] # diagonal up
    ]

    def initialize(player_1 = Player::Human.new("X"),
                    player_2 = Player::Human.new("O"),
                     board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        return @player_1 if board.turn_count.even?
    else
        @player_2
    end

    def won?
        winning_combo = WIN_COMBINATIONS.detect do |combo|
            board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if winning_combo = won?
            @board.cells[winning_combo.first]
        end
    end

    def turn
        player = current_player
        puts "#{current_player.token}'s turn.'"
        current_move = player.move(@board)
        if !@board.valid_move?(current_move)
            turn
        else
            puts "Turn: #{@board.turn_count + 1}\n"
            @board.display
            puts "\n"
            @board.update(current_move, player)
            puts "#{player.token} moved #{current_move}"
            @board.display
            puts "\n\n"
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cats Game!"
        end
    end



end
