require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        win_combo
      elsif board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        win_combo
        end
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won? && board.cells[won?[0]] == "X"
      "X"
    elsif won? && board.cells[won?[0]] == "O"
      "O"
    end
  end

  def turn
    player = current_player
    move = player.move(board)
    if !board.valid_move?(move)
      puts "Invalid move. Try again."
      turn
    else
      board.update(move, player)
      board.display
      puts "\n"
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
      puts "\n"
    elsif won?
      puts "Congratulations #{winner}!"
      puts "\n"
    end
  end

end
