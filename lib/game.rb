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
        if board.cells.all? { |cell| cell !=  " " } || won? == true
            true
        else
            false
        end
    end

    def won?
        WIN_COMBINATIONS.find do |win_combination| 
            board.cells[win_combination[0]] == board.cells[win_combination[1]] && 
            board.cells[win_combination[1]] == board.cells[win_combination[2]] && 
            board.taken?(win_combination[0])
        end
    end

    def draw?
        over? && !won?
    end

    def winner
         # board.cells[won?.first] if won? #this also works because won?.first represents the first play
        if win_combination = won?
            board.cells[win_combination[0]]
        end
    end

    def turn
        if board.input = gets
            "1"
            binding.pry
    end

end
        # if board.move(input)
        #     puts "1"
        # elsif 
        #     puts "1"
        



# WIN_COMBINATIONS.detect do |win_combination| win_combination.all? {|win_index| board[win_index] == "X" } || win_combination.all? {|win_index| board[win_index] == "O" } == true
          
# board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
#                   && position_taken?(board, win_combination[0])
        
            
            
            # win_combo.all? {|win_index| board[win_index] == "X" } || win_combo.all? {|win_index| board[win_index] == "O" } == true
            # win_combo
        # game_won = WIN_COMBINATIONS.detect do |win_combination|
        #     win_combination.all? {|win_index| board[win_index] == "X" } ||
        #     win_combination.all? {|win_index| board[win_index] == "O" }
        # returns true for a draw
        # a draw is when all spaces are full or there is a wining combination ... use the any method? 
        # # if Board.full? || any winning combinations are not possible
        # # #     def won?(board)
        # #         WIN_COMBINATIONS.find {|win_combination| board[win_combination[0]] == board[win_combination[1]]
        # #          && board[win_combination[1]] == board[win_combination[2]]
        # #           && position_taken?(board, win_combination[0])}
        # #       end

        # def won?
        #     WIN_COMBINATIONS.each do |win_combination| 
        #         binding.pry            
        #         if win_combination[0] == board.cells[win_combination[0]] && win_combination[1] == board.cells[win_combination[1]] && win_combination[2] == board.cells[win_combination[2]]
        #             win_combination
        #             end
        #         end
        # end