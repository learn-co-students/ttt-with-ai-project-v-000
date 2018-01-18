require "pry"
class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)

        @board = board
        @player_1 = player_1
        @player_2 = player_2

    end

    def current_player
        # whose turn is it?
        # odd turns = "X" or player_1
        # even turns = "O" or player_2
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def full?
        @board.cells.all? {|i| i == "X" || i == "O"}
    end

    def draw?
        full? && !won?
    end

    def won?
        WIN_COMBINATIONS.any? { |combination|
            combination.all? { |i| @board.cells[i] == "X" } || combination.all?{ |i| @board.cells[i] == "O"}
            }
    end



    def over?
        won? || draw? || full?
    end

    def winner
        wc = winning_combination
        if wc
            winning = board.cells[wc[0]]
        else
            return nil
        end
    end

    def turn
        player = current_player
        index = player.move(@board)

        if @board.valid_move?(index)
            @board.update(index,player)
            @board.display
        else
            puts "Invalid move, try again."
            turn
        end

    end

    def winning_combination
        winning_combo = nil
        WIN_COMBINATIONS.each {|c|
            if c.all? { 
                
                |i| @board.cells[i] == "X" 
                
                } || c.all?{
                    
                    |i| @board.cells[i] == "O"
                    
                    }
                winning_combo = c
            end
            }
        winning_combo
    end


    def play

        if !over? && !won?
            9.times do
                turn
                if over? || won?
                    break
                end 
            end
        end

        if won?
            wc = winning_combination

            w = winner
            puts "Congratulations #{w}!"
        else
            puts "Cat's Game!"
        end

    end
end