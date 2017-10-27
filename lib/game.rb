require './lib/player.rb'

class Game
  Players::Human
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def full?(cells)
    cells.all? {|cell| cell != " "}
  end

  def over?
    won? || draw? || @board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      mapped_cells = combo.map {|i| board.cells[i]}
       if mapped_cells.count(mapped_cells.first) == 3 && mapped_cells.first != ' '
         combo
       else
         false
       end
     end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    if won?
      return @board.cells[won?[1]]
    end
  end

  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
      @board.display
    else
      puts "invalid"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
