class Game
  attr_accessor :board, :player_1, :player_2
  # attr_reader

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    won? || draw? ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
        self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
        self.board.cells[combo[0]] != " "
    end
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def draw?
    !won? && self.board.full? ? true : false
  end

  def turn
    if current_player.is_a?(Players::Human)
      next_move = current_player.move(self.board.cells)
    else
      next_move = current_player.move(self.board)
    end

    if self.board.valid_move?(next_move)
      self.board.update(next_move, current_player)
      self.board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}! Game Over!"
    else
      puts "Cat's Game!"
      puts "Byyyyeee"
    end

  end

end
