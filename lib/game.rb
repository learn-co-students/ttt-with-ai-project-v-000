class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom row
    [0, 3, 6],  # Left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],  # Right column
    [0, 4, 8],  # Diagonal 1
    [6, 4, 2]   # Diagonal 2
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over? 
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") ||
      (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    current_move = current_player.move(board)

    if board.valid_move?(current_move)
      puts "#{current_player.token} moved to position #{current_move}:"
      board.update(current_move, current_player)
      board.display
    else
      puts "Invalid move. Please enter a different number."
      board.display
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
      puts "Cats Game!"
    end
  end
end