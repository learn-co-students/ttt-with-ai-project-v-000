class Game
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ].freeze

    attr_accessor :board, :player_1, :player_2

    #need to add name somewhere in the initialization?

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    # define current_player here
    def current_player
      @board.turn_count.even? ? player_1 : player_2
    end

    # over? here - won, is a draw, or full
    def over?
      won? || draw?
    end

    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        if @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
          @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
          (@board.cells[win_combo[0]] == 'X' || @board.cells[win_combo[0]] == 'O')
          return win_combo
        else
          false
        end
      end
    end

    # define draw? here
    def draw?
      !self.won? && board.full?
    end

    # define winner here
    def winner
      if win_combo = won?
        @board.cells[win_combo.first]
      end
    end

    # define turn method here
    def turn #work on this dadgum method
      move = self.current_player.move(@board)
      if !board.valid_move?(move)
        puts "NOT a valid move. Play again, please!"
        turn
      end
        @board.update(move, self.current_player)
    end


    # define #play here
    def play
      until self.over? # until the game is over
        @board.display
        self.turn # take turns
      end
      if self.won?
          puts "Congratulations #{winner}!"
      else draw?
           puts "Cat's Game!"
      end
    end
  end
