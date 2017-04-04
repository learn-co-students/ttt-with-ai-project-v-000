class Game

  include Players
  extend Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board=(baord)
    @board = []
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.find do |array|
      @board.cells[array[0]] == @board.cells[array[1]] && @board.cells[array[1]] == @board.cells[array[2]] &&
      (@board.cells[array[0]] == "X" || @board.cells[array[0]] == "O")
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    if array = won?
      @board.cells[array[0]]
    end
  end

  def turn
    puts "Please enter your move from 1 - 9."
    current_move = current_player.move(@board)

    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
      @board.display
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
