require 'require_all'

class Game

  WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      self.board = board
    end

    def current_player
      @board.turn_count.even? ? self.player_1 : self.player_2
    end

    def turn
      player = current_player
      input = player.move(self.board).to_i
      if @board.valid_move?(input)
        self.board.update(input, player)
      else
        turn
      end
    end

    def won?
     WIN_COMBINATIONS.find do |combo|
       @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.taken?(combo[0]+1)
     end
   end

    def draw?
      self.board.full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      if won?
        combo = won?
        self.board.cells[combo[0]]
      end
    end

    def play
      until over?
        turn
      end
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
