class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.odd?
      player_2
    elsif board.turn_count.even?
      player_1
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end

  def turn
    player_now = current_player
    current_move = player_now.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player_now)
      puts "#{player_now.token} moved #{current_move}"
      @board.display
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
