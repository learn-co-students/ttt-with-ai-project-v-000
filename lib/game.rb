class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
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
    draw? || won?
  end

  def won?
    exes = @board.cells.map.with_index.map { |mark, i| i if mark == "X" }
    oes = @board.cells.map.with_index.map { |mark, i| i if mark == "O" }

    WIN_COMBINATIONS.each { |e| return "X" if e - exes == [] }
    WIN_COMBINATIONS.each { |e| return "O" if e - oes == [] }
    false
  end

  def draw?
    if @board.full? && won? == false
      true
    else
    false
    end
  end

  def winner
    if won?
      won?
    else
      nil
    end
  end

  def turn
    move = current_player.move(@board) #returns string input
    until @board.valid_move?(move)
      puts "Invalid input.  Please try again."
      move = current_player.move(@board)
    end
    @board.update(move, current_player)
  end

  def play
    until over?
      turn
      @board.display
    end

    if draw?
      puts "Cat's Game!"
    elsif won? == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end
end
