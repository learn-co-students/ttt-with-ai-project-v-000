class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #Diagonal left-to-right
    [6,4,2]  #Diagonal right-to-left
  ]

  def current_player
    if self.board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0]+1)
    end
  end

  def draw?
    !won? && board.full?
  end


  def over?
    won? || draw?
  end

  def winner
    if won?.is_a?(Array) == true
      winner = won?
      board.cells[winner[0]]
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    position = board.position(current_move)
    if board.valid_move?(current_move)
      board.update(current_move, player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
