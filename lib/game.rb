class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

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

def current_player
  #if the turn count is even, then it's going to be player 1's turn
  if self.board.turn_count.even?
    player_1
  else
    player_2

  end
  #else is player 2's
end

def won?
  WIN_COMBINATIONS.find do |win_combo|
    #win_combo will be an array
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]
    position_1 = self.board.cells[index_1]
    position_2 = self.board.cells[index_2]
    position_3 = self.board.cells[index_3]
    position_1 == position_2 && position_3 == position_1 && position_2 != " "

    end
  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      index = won?[0]
      self.board.cells[index]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "turn: #{@board.turn_count + 1}"
      @board.display
      @board.update(current_move, player)
    end
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
