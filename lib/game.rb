require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  # Class Constants #

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


  # Initialize #

  def initialize(player_1 = Players::Human.new(token="X"), player_2 = Players::Human.new(token="O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  # Instance Methods #

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    # checking ONLY #full? causes infinite loop in play method
    @board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] != " " &&
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    @board.cells[won?.first] if won?
  end

  def turn
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
      puts "\n-------\n"
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
    end

    if draw?
      puts "Cat's Game!"
    end



  end



end
