class Game

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],#horizontal
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],#vertical
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],#diagonal
    [2, 4, 6],
  ]

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0] + 1)
  end

  end

  def draw?
    @board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == "X" && @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]]
        return "X"
      end
      if @board.cells[combination[0]] == "O" && @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]]
        return "O"
      end
    end
      nil
  end

  def turn
    position = current_player.move(@board)
    if @board.valid_move?(position)
      @board.update(position, current_player)
    else
      turn
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
