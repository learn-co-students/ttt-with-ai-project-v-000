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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combo|
      (board.cells[win_combo[0]] == "X" || board.cells[win_combo[0]] == "O") && board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[1]] == board.cells[win_combo[2]]
      end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.detect do |winner|
      if board.cells[winner[0]] == "X" && board.cells[winner[1]] == "X" && board.cells[winner[2]] ==  "X"
        return "X"
      elsif board.cells[winner[0]] == "O" && board.cells[winner[1]] == "O" &&
        board.cells[winner[2]] == "O"
        return "O"
      end
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    elsif !board.valid_move?(input)
      turn
    end
    board.display
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

end
