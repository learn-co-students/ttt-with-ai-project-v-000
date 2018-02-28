class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    x = WIN_COMBINATIONS.find {|win_combination|
      test_array = [board.cells[win_combination[0]], board.cells[win_combination[1]], board.cells[win_combination[2]]]
      test_array == ["X", "X", "X"] || test_array == ["O", "O", "O"]
    }
    x == nil ? false : x
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    player = current_player
    user_input = player.move(board)
    if board.valid_move?(user_input)
      board.update(user_input, player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    puts "Congratulations #{winner}!" if winner
    puts "Cat's Game!" if !winner
  end
end
