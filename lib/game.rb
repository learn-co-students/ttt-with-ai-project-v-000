class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |winning_combo|
      board.cells[winning_combo[0]] == board.cells[winning_combo[1]] && board.cells[winning_combo[2]] == board.cells[winning_combo[0]] && board.cells[winning_combo[2]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      board.cells[won?[0]] == "X" ? "X" : "O"
    end
  end

  def turn
    board.display
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def play
    until over?
      turn
    end
      if winner
        board.display
        puts "Congratulations #{winner}!"
      else
        board.display
        puts "Cat's Game!"
      end
  end
end
