class Game
  #attributes & variables
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

  #modules

  #initialize
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #class methods

  #instance methods
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def winner
    board.cells[won?.first] if won?
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0]+1)
    end
  end

  def draw?
    board.full? && !(won?)
  end

  def turn
    input = current_player.move(board)
    #  binding.pry

    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
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
