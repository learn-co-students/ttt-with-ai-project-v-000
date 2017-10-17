class Game
  attr_accessor :board, :player_1, :player_2

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
    @player_1 = player_1
    @player_2 = player_2
    @board = board

    board.display
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end


  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[0]] == self.board.cells[win_combo[2]] && self.board.taken?(win_combo[0] + 1)
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move(board)

    if !self.board.valid_move?(input)
      turn
    else
      self.board.update(input, current_player)
      self.board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
