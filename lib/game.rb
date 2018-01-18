class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [0,4,8]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]) &&
      board.cells[combo[0]] != " "
    end
  end

  def draw?
    if won?
      false
    elsif board.full? && !won?
      true
    end
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end


  def turn
    loc = current_player.move(@board)
    !board.valid_move?(loc) ? turn : board.update(loc, current_player)
  end

  def play
    until over?
      turn
      board.display
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end


end
