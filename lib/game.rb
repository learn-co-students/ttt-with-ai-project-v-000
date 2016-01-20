class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all?{|token| board.cells[token]=="X"} || win_combo.all?{|token| board.cells[token]=="O"}
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    board.display
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
    end
    if winner
      board.display
      puts "Congratulations #{winner}!"
    else
      board.display
      puts "Cats Game!"
    end
  end

end