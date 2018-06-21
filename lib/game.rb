class Game
  attr_accessor :board, :number_of_players, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
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
    !won? && board.full? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    puts "It is Player #{current_player.token}'s turn\n"
    puts "Pick an available position between 1-9: \n"
    board.display
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts "Invalid number. Try again!"
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
    board.display
  end
end
