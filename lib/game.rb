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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
           if board.cells[combo[0]] == "X" &&
           board.cells[combo[1]] == "X" &&
           board.cells[combo[2]] == "X" ||
           board.cells[combo[0]] == "O" &&
           board.cells[combo[1]] == "O" &&
           board.cells[combo[2]] == "O"
           return combo
         end
    end

  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won? then board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    input = player.move(@board)
    if @board.valid_move?(input)
     @board.update(input, player)
     @board.display
    else
      turn
  end

  def play
    until over? || won? || draw?
      turn
    end
    if won?
      @board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      @board.display
      puts "Cat's Game!"
    end
    end
  end
end
