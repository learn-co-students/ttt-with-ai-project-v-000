class Game
  attr_accessor :board, :player_1, :player_2, :winning_token


  WIN_COMBINATIONS =
  [
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
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|cell| board.cells[cell] == player_1.token} || combo.all? {|cell| board.cells[cell] == player_2.token}
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
     self.board.full? || won? || draw?
  end

  def winner
    player_1.token == board.cells[won?[0]] ? player_1.token : player_2.token if won?
  end

  def turn
   puts "Please enter 1-9:"
   index = current_player.move(board)
   if board.valid_move?(index)
    board.update(index, current_player)
    board.display
  else
    turn
   end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end 
