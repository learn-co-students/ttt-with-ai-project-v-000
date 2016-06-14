class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0, 1, 2], #top row, remember commas after each sub-array
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 4, 8], #diagonal left
    [6, 4, 2], #diagonal right
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8] #right column
    ]

    def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
       @player_1 = player_1
       @player_2 = player_2
       @board = board
    end

    def play
        until over?
            self.board.display
            turn
        end

        if won?
            self.board.display
            puts "Congratulations #{winner}!"
        elsif draw?
            self.board.display
            puts "Cats Game!"
        end
    end

    def current_player
       self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
    end

    def turn
        the_move = current_player.move(self.board)
        if self.board.valid_move?(the_move)
            return self.board.update(the_move, current_player)
        else
            turn
        end
    end

    def draw?
        if !won? && self.board.full?
            return true
        else
            return false
        end
    end

    def over?
        if won? || draw?
          return true
        else
          return false
        end
    end

    def won?

        matches = WIN_COMBINATIONS.select do |combo|

            o_wins = combo.all? do |space|
                self.board.cells[space]=="O"  #needed to change it to just board[space]. Also needed to remove the "if" I had here, because "all?" already checks for truth
            end #end of combo.all? and the "winning" declaration

            x_wins = combo.all? do |space|
                self.board.cells[space]=="X"  #needed to change it to just board[space]. Also needed to remove the "if" I had here, because "all?" already checks for truth
            end #end of combo.all? and the "winning" declaration

            o_wins || x_wins # this was the key that allowed me to win. could also condense the combo.all? methods' code blocks into curlicue brackets
        end #end of WIN_COMBINATONS.each

        final_check = matches.any? do |i|
            i.length>1
        end

        if final_check
            return matches[0]
        else
            return false
        end
    end

    def winner
        if won?
            return self.board.cells[won?[0]]
        end
    end

end
