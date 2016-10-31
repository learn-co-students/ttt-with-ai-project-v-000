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

    def initialize(play1 = Players::Human.new("X"), play2 = Players::Human.new("O"), board=Board.new)
        @board = board
        @player_1=play1
        @player_2=play2
    end

    def current_player
        if @board.turn_count%2==0
            temp = "X"
        else
            temp = "O"
        end

        if temp == player_1.token
            player_1
        else
            player_2
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            x=combo.all? do |index|
                @board.cells[index]=="X"
            end
            o=combo.all? do |index|
                @board.cells[index]=="O"
            end
            x||o
        end
    end

    def draw?
        board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        temp=WIN_COMBINATIONS.detect do |combo|
            x=combo.all? do |index|
                @board.cells[index]=="X"
            end
            o=combo.all? do |index|
                @board.cells[index]=="O"
            end
            x||o
        end
        if temp.nil?
            nil
        else
            @board.cells[temp[0]]
        end
    end

    def turn
        x =""
        until @board.valid_move?(x) do

            if current_player==player_1
                x=player_1.move(@board)
            else
                x=player_2.move(@board)
            end
        end
        @board.update(x,current_player)
        @board.display
        puts " "
    end

    def play
        @board.display
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cats Game!"
        end
    end

end
