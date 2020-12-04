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

    def initialize(player_1= Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end

    def won?
        WIN_COMBINATIONS.each do |a|
            if @board.cells[a[0]] == "X" && @board.cells[a[1]]=="X"&&@board.cells[a[2]] == "X" ||
                @board.cells[a[0]] == "O" && @board.cells[a[1]]=="O"&&@board.cells[a[2]] == "O"
                return a
            end
        end
        false
    end

    def draw?
        @board.full? && !self.won?
    end

    def over?
        self.draw? || self.won?
    end

    def winner
        a = self.won?
        a ? @board.cells[a[0]] : nil
    end

    def turn
        puts "#{current_player.token}'s Turn:"
        self.board.display
        input = current_player.move(self.board)
        if self.board.valid_move?(input)
            self.board.update(input, current_player)
        else
            self.turn
        end
    end

    def play
        turn until self.over?
        if self.won?
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end

end