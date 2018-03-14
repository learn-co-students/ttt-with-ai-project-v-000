
class Game

    attr_accessor  :board, :player_1, :player_2


    WIN_COMBINATIONS =  [
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
       @board.turn_count % 2 == 0 ? @player_1 : @player_2 # Can change based on player_1 and player_2 tokens on initialize
    end

    def over?
        if won? != false
            return true
        end
        if draw?
            return true
        end
         return false
        #binding.pry
    end

    def won?

        win = WIN_COMBINATIONS.find do |combo|
             @board.cells.values_at(combo[0],combo[1],combo[2]).all?{|v| v == "X"}  || @board.cells.values_at(combo[0],combo[1],combo[2]).all?{|v| v == "O"}
         end
          if win == nil
              return false
          elsif win != nil
              win
          end

    end

    def draw?
        @board.full? && won? == false ? true : false
    end

    def winner
        won? == false ? nil : @board.cells[won?[0]]
    end

    def turn
        move = current_player.move(@board)
        if @board.valid_move?(move)
            @board.update(move, current_player)
        end
    end

     def play
         until over?
             turn
             won?
             draw?
        end
        if won? != false
            if winner == "X"
                puts "Congratulations X!"
            else
                puts "Congratulations O!"
            end
        end
        if draw?
           puts "Cat's Game!"
        end
    end

end
