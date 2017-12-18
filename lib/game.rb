class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # 6 % 2 == 0
    # 7 % 3 == 1
    if board.turn_count % 2 == 0   #modulo
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
      @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
      @board.cells[win_combination[0]] != " "
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board.cells[won?[0]]

    end
  end
#recursion - when a method calls itself
  def turn
    most_recent_move = current_player.move(@board)
    if !@board.valid_move?(most_recent_move)
      turn
    else
      @board.update(most_recent_move, current_player)
    end
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
