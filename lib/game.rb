require 'pry'
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
    @board.turn_count.even? ? @player_1 : @player_2
end

  def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      @board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] == "X"  && @board.taken?(win[0]+1)||
      @board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] == "O" && @board.taken?(win[0]+1)
    end
  end

  def winner
    if won?
    board.cells[won?.first]
  end
end

  def turn
    counter = 0
    player = current_player
    input = player.move(@board)

#binding.pry
     if @board.valid_move?(input)

      @board.update(input, player)
      @board.turn_count

    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  end
