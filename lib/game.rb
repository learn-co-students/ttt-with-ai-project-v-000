class Game
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
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
    # binding.pry
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |x|
      @board.cells[x[0]] == @board.cells[x[1]] && @board.cells[x[1]] == @board.cells[x[2]] && @board.cells[x[1]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won? && @board.cells[won?[0]] == "X"
      player_1.token
    elsif won? && @board.cells[won?[0]] == "O"
      player_2.token
    else
      nil
    end
  end

  def turn
    current_p = current_player
    attempted_move = current_p.move(@board)
    if @board.valid_move?(attempted_move) == false
      puts "Thats an invalid move brubru"
      turn
    else
      @board.update(attempted_move, current_p)
      @board.display
      puts "Where would you like to go player #{current_player.token} please enter 1 - 9"
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
