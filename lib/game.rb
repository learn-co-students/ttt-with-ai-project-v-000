require 'pry'
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
    [6,4,2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
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
    WIN_COMBINATIONS.detect do |winners|
      winners.all? {|numbers| board.cells[numbers] == "X"} || winners.all? {|numbers| board.cells[numbers] == "O"}
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if won = won?
      board.cells[won[0]]
    end
  end

  def turn
    player = self.current_player
    move = player.move(board)
    if !board.valid_move?(move)
      move = player.move(board)
    end
    board.update(move,player)
  end

  def play
    while !over?
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
