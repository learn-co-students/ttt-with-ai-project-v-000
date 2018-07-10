require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2  = Players::Human.new("O"), board = Board.new)
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
  [2,4,6]
  ]

  def current_player
    if @board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[0]] == @board.cells[combination[2]] && @board.cells[combination[2]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      if @board.cells[won?[0]] == "X"
        "X"
      else
        "O"
      end
    end
  end

  def turn
    @board.display
    input = current_player.move(board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if winner
      @board.display
      puts "Congratulations #{winner}!"
    else
      @board.display
      puts "Cat's Game!"
    end
  end
end