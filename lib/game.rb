class Game

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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won? #set winning_combo to the retun of won?
      @board.cells[winning_combo.first]
    end
  end

  def turn
    cellnum = current_player.move(@board)
    if @board.valid_move?(cellnum)
      @board.update(cellnum, current_player)
    else
      turn
    end
  end

  def play
    while !over? do
      @board.display
      turn
    end

    @board.display
    puts "Congratulations #{winner}!" unless !won?
    puts "Cat's Game!" unless !draw?
  end

end
