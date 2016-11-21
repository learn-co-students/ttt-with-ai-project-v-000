class Game

  include Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
                      [0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]
                              ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      puts "Your input was invalid."
      turn
    end
  end

  def play
    while !(over?)
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
     @board.cells[combo[0]] == @board.cells[combo[1]] &&
     @board.cells[combo[0]] == @board.cells[combo[2]] &&
     @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    board.full? && !(won?)
  end

  def over?
    won? || draw?
  end

  def winner
    if w = won?
      board.cells[w.first]
    end
  end

end
