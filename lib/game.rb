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
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_numbers|
      board.cells[winning_numbers[0]] == board.cells[winning_numbers[1]] && board.cells[winning_numbers[2]] == board.cells[winning_numbers[0]] && board.taken?(winning_numbers[0] + 1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_game = won?
      board.cells[winning_game.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      puts "#{player.name} chooses space #{current_move}."
      board.update(current_move, player)
      board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      winner
    elsif draw?
      puts "Cat's Game!"
      "Cat's Game!"
    end
  end
end
