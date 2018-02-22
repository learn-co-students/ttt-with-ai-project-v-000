class Game

  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [6,7,8],
    [3,4,5],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 1 ? @player_2 : @player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
         @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
         @board.taken?(win_combination[0]+1) == true
       elsif @board.full?
          false
      end
    end
  end

  def over?
    over = (won? || @board.full? || draw?)
    over ? true : false
  end

  def draw?
    draw = !won? && @board.full?
    draw ? true : false
  end


end
