require 'pry'


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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2

  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if combo.all? {|c| @board.cells[c] == "X"}
        @winner = "X"
        return combo
      elsif combo.all?{|c| @board.cells[c] == "O"}
        @winner = "O"
        return combo
      end
    end
    nil
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won? != nil
      @winner
    end

    #grabts the current players board selection and store in input
    #if the move is valid, it updates the board with the move and player token.
    def turn
      input = current_player.move(board)

      if board.valid_move?(input)
        board.update(input, current_player)
      else
        turn
      end
    end

    def play
      while !over?
        turn
      end
      won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")

    end
  end
end
