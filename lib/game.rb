class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def turn_count
      self.board.cells.count{|square| square != " " }
    end

    def current_player
      turn_count.even? ? self.player_1 : self.player_2
    end

    def won?
      WIN_COMBINATIONS.any? do |combo|
        if board.position(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end
    end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
      if combo = won?
        @board[combo[0]]
      end
    end

    def play
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
