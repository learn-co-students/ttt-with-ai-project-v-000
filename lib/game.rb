
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :current_player

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
      wincombo = WIN_COMBINATIONS.detect { |wincombo|
        @board.cells[wincombo[0]] == @board.cells[wincombo[1]] &&
        @board.cells[wincombo[1]] == @board.cells[wincombo[2]] &&
        @board.taken?(wincombo[0]+1)}
  end

  def draw?
    !won? && @board.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def winner
    if won? != nil && @board.cells[won?[0]] == "X"
      "X"
    elsif won? != nil && @board.cells[won?[0]] == "O"
      "O"
    else nil
    end
  end

  def turn
    input = current_player.move(board)
    @board.valid_move?(input) ? @board.update(input, current_player) : turn
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
    puts "Congratulations #{winner}!"
    end
  end

end
