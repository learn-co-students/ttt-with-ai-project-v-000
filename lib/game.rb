class Game

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


attr_accessor :board , :player_1, :player_2


def initialize(player_1 = Players::Human.new("X"),
  player_2 = Players::Human.new("O"),
  board = Board.new)
  @board= board
  @player_1= player_1
  @player_2= player_2
end

  def current_player
    if turn_count.even?
      @player_1
    else
      @player_2
    end
  end


  def turn_count
    @board.cells.count {|position| position !=" "}
  end

  #won
  def won?
        WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0])
      end
  end

  def draw?
    !won? && board.full?
  end








end
