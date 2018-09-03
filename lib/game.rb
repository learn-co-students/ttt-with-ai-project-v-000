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
  end

  def current_player
    players = [self.player_1, self.player_2].sort_by {|x| x.token}.reverse
    first_player = players[0]
    second_player = players[1]
    self.board.turn_count % 2 == 0 ? first_player : second_player
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      a = self.board.cells[combo[0]]
      b = self.board.cells[combo[1]]
      c = self.board.cells[combo[2]]

      if (a == b) && (b == c) && (a != " ")
        return combo
      else
        nil
      end
    end
  end

  def draw?
    return true if !!self.won? == false && self.board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    win_combo = self.won?
    self.won? ? self.board.cells[win_combo[0]] : nil
  end

  def play
    self.turn until self.over?
    self.winner ? (puts "Congratulations #{self.winner}!") : (puts "Cat's Game!")
  end

  def turn
    puts "#{current_player.token}, you are up."
    player = self.current_player
    move = self.current_player.move(board)
    if self.board.valid_move?(move)
      self.board.update(move, player)
    else
      puts "Invalid entry received."
      turn
    end
    board.display
  end
end
