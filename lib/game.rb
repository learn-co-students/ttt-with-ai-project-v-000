class Game
  attr_accessor :board, :player_1, :player_2
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
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    @winning_combo = WIN_COMBINATIONS.detect do |combo|
      @board.taken?(combo[0] + 1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
    end
    @winning_combo.nil? ? false : true
  end

  def winner
    won? ? @board.cells[@winning_combo[0]] : nil
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def play
    until over?
      turn
    end
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    current = current_player
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
      @board.display
      puts ""
      puts "Player #{current.token} made a move."
      puts ""
    else 
      puts "invalid"
      turn
    end
  

  end

end
