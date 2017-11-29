class Game
    
    attr_accessor :player_1, :player_2, :board, :token

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
        game_won = WIN_COMBINATIONS.detect do |win_combination|
            win_combination.all? {|win_index| board[win_index] == "X" } ||
            win_combination.all? {|win_index| board[win_index] == "O" }
        if game_won || Board.full?
        # returns true for a draw
        # a draw is when all spaces are full or there is a wining combination ... use the any method? 
        # # if Board.full? || any winning combinations are not possible
        # # #     def won?(board)
        # #         WIN_COMBINATIONS.find {|win_combination| board[win_combination[0]] == board[win_combination[1]]
        # #          && board[win_combination[1]] == board[win_combination[2]]
        # #           && position_taken?(board, win_combination[0])}
        # #       end
    end
end
end
end


