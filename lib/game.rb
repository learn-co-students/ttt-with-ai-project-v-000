class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def turn_count
    self.board.cells.count{|square| square != " " }
  end

  def current_player
    turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.taken?(combo[0]+1)
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      board.cells[combo[0]]
    end
  end

  def turn
    player = current_player
    player_move = player.move(self.board).to_i
    if self.board.valid_move?(player_move)
      puts "Turn: #{self.board.turn_count+1}\n"
      self.board.display
      self.board.update(player_move, player)
      puts "#{player.token} moved #{player_move}"
      self.board.display
      puts "\n\n"
    else
      turn
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
