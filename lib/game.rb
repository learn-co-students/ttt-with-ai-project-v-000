class Game
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # \
    [6,4,2]  # /
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(p1 = Player::Human.new("X"), p2 = Player::Human.new("O"), board = Board.new)
    @player_1, @player_2, @board = p1, p2, board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? || full?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O")
        return win_combo
      end
    end
    false
  end

  def draw?
    !won? && full?
  end

  def full?
    board.cells.all? { |token| token == "X" ||  token == "O" }
  end

  def winner
    win_combo = won?
    board.cells[win_combo[0]] if win_combo
  end

  def turn
    position = current_player.move(board)
    until board.valid_move?(position)
      puts "Input invalid. Please select an empty space by inputting an integer between 1 and 9"
      position = current_player.move(board)
    end
    board.update(position, current_player)
  end

  def play
    board.display
    until over?
      turn
      board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end

end
