class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] && self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]] && self.board.taken?(win_combination[0] + 1)
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    player = current_player
    current_move = player.move(self.board)
    if !self.board.valid_move?(current_move)
      turn
    else
      self.board.update(current_move, player)
    end
  end


  def play
   turn until over?
   if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
