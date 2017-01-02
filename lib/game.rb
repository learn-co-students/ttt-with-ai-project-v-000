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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect { |win_combination| board.cells[win_combination[0]] == board.cells[win_combination[1]] && board.cells[win_combination[0]] == board.cells[win_combination[2]] && board.cells[win_combination[0]] != " "}
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if winner = won?
      board.cells[winner[0]]
    end
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
  end

  def play
    until over?
      board.display
      turn
    end
    board.display
    if over? && won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
