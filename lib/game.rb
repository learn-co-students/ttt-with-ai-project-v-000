class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |e|
      board.cells[e[0]] == board.cells[e[1]] &&
      board.cells[e[1]] == board.cells[e[2]] &&
      !(board.cells[e[0]] === "" || board.cells[e[0]] === " ")
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    input = self.current_player.move(board)
    if board.valid_move?(input)
      board.update(input, self.current_player)
      board.display
    else
      self.turn
    end
  end

  def play
    self.turn until over?
    puts self.winner ? "Congratulations #{self.winner}!" : "Cat's Game!"
  end
end
