require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner

  #Define WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board.cells[array[0]] == @board.cells[array[1]] && @board.cells[array[1]] == @board.cells[array[2]] && (@board.cells[array[0]] == "X" || @board.cells[array[0]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winXO = won?
      @winner = @board.cells[winXO.first]
    end
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def turn
    Player.move(@board)
    #puts "Please enter 1-9:"
    #input = gets.strip
    index = input.to_i - 1
    if @board.valid_move?(index)
      move(index, current_player)
      @board.display
    else
      turn
    end
  end


end
