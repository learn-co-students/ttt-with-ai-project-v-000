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
  [6,4,2]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
  @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X" ||
      @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
      true
    else false
    end
  end
  end

  def draw?
  @board.full? && !won?
  end

  def over?
  won? || draw?
  end


  def winner
    if won = won?
    board.cells[won.first]
end
  end

  def turn
    puts "Enter 1-9:"
    board.display
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
    turn
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
