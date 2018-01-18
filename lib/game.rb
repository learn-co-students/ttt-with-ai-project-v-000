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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    @board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? { |position| board.cells[position] == "X" }
      return combo if combo.all? { |position| board.cells[position] == "O" }
    end
    false
  end

  def draw?
    !won? && over?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    position = current_player.move(board)

    if board.valid_move?(position)
      board.update(position, current_player)
    else
      puts "Please enter a valid move."
      turn
    end
  end

  def play
    board.display
    until won? || draw?
      turn
      board.display
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
