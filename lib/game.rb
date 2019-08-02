class Game
  attr_accessor :board, :player_1, :player_2, :current_player, :winner

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.current_player = player_1 : self.current_player = player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      self.board.taken?(combo[0]+1)
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    if winning_combo = won?
      self.winner = self.board.cells[winning_combo.first]
    end
  end

  def turn
    player = self.current_player
    puts "Turn: #{self.board.turn_count}"
    self.board.display
    move = player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
    else
      puts "Invalid move..."
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
      self.board.display
      "won"
    elsif draw?
      puts "Cat's Game!"
      self.board.display
    end
  end
end