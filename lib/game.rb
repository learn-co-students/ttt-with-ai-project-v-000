class Game

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combinations|
      @board.cells[combinations[0]] == @board.cells[combinations[1]] &&
      @board.cells[combinations[1]] == @board.cells[combinations[2]] &&
      (@board.cells[combinations[0]] == "X" || @board.cells[combinations[0]] == "O")
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if combinations = won?
      @winner = board.cells[combinations[0]]
    end
  end

  def turn
    player = current_player
    input = player.move(board) # ask for input
    if @board.valid_move?(input)
      @board.update(input, player)
    else # ask for input again after a failed validation
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
