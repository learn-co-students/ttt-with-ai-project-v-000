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

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    player_1 ? @player_1 = player_1 : @player_1 = Players::Human.new("X")
    player_2 ? @player_2 = player_2 : @player_2 = Players::Human.new("O")
    board ? @board = board : @board = Board.new
  end

  def turn
    i = "0"
    until self.board.valid_move?(i)
      i = current_player.move(self.board)
    end
    self.board.update(i, current_player)
  end

  def play
    self.board.display
    until over?
      turn
      self.board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def current_player
    self.board.turn_count%2 == 0 ? self.player_1 : self.player_2
  end

  def winner
    winner = won? if won?
    board.cells[winner[0]] if won?
  end

  def over?
    won? || draw?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |c|
      board.cells[c[0]] == board.cells[c[1]] && board.cells[c[1]] == board.cells[c[2]] && board.cells[c[0]] != " "
    end
  end

  def dont_hate_the_player
    "hate the self"
  end

end #class Game
