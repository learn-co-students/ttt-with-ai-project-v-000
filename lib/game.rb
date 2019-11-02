class Game
  attr_accessor :board, :player_1, :player_2, :current_player
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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      @current_player = player_1
    else
      @current_player = player_2
    end
  end

  def over?
    self.board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]
      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combo
      end
    end
  else
    false
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    if self.won?
      index = self.won?[0]
      self.board.cells[index]
    end
  end

  def turn
    input = current_player.move(board)
    unless board.valid_move?(input)
      puts "Invalid turn! Try again:"
      puts input
      board.display
      turn
    end
    board.update(input, current_player)
    board.display
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
