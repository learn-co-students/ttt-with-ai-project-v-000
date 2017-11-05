class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |x|
      position_1 = @board.cells[x[0]]
      position_2 = @board.cells[x[1]]
      position_3 = @board.cells[x[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O")
        return x
      end
    end
    return false
  end

  def draw?
    if @board.full? && won? == false
      true
    end
  end

  def winner
    if over?
      @board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move) == false
      turn
    else
      @board.display
      @board.update(current_move, player)
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
