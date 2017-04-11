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

    def initialize(player_1 = nil, player_2 = nil, board = nil)
        player_1 = Players::Human.new("X") if player_1.nil?
        player_2 = Players::Human.new("O") if player_2.nil?
        board.nil? ? @board = Board.new : @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def self.combinations
        WIN_COMBINATIONS
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end

    def over?
        self.draw? || self.won?
    end

    def won?
        WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "X"}} ||WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "O"}}
    end

    def draw?
        self.board.full? && !self.won?
    end

    def winner
        if WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "X"}}
            "X"
        elsif WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "O"}}
            "O"
        else
            nil
        end
    end

    def turn
        user_input = self.current_player.move(self.board)
        if !self.board.valid_move?(user_input)
            self.current_player.move(self.board)
        else
            self.board.update(user_input, self.current_player)
        end
        user_input
    end
    
    def play
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end
    
end