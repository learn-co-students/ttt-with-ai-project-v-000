require 'pry'
class Game

  attr_accessor :board, :player, :player_1, :player_2, :WIN_COMBINATIONS, :human, :cells

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

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

    def current_player
      turn = self.board.turn_count
      if turn.odd? == true
        self.player_2
      else
        self.player_1
      end
    end

    def over?
      self.won? || self.draw?
    end

    def won?
      WIN_COMBINATIONS.detect do |winc|
        self.board.cells[winc[0]] == self.board.cells[winc[1]] &&
        self.board.cells[winc[1]] == self.board.cells[winc[2]] &&
        (self.board.cells[winc[0]]  == "X" || self.board.cells[winc[0]] == "O")
      end
    end

    def draw?
      self.board.full?  && !self.won?
    end

    def winner
         if winc = won?
           @winner = @board.cells[winc[0]]
         end
       end

    def turn
      player = current_player
      input = player.move(@board)
      if @board.valid_move?(input)
        @board.update(input, player)
        @board.display
      else turn
      end
    end

    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
