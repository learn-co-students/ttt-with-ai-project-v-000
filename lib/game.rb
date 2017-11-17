
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], #Rows
    [0,3,6], [1,4,7], [2,5,8], #Columns
    [0,4,8], [2,4,6] #Diagonals
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    player_1 = Players::Human.new("X") if player_1.nil?
    player_2 = Players::Human.new("O") if player_2.nil?
    board.nil? ? @board = Board.new : @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
   WIN_COMBINATIONS.detect do |win_combination|
     @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
     @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
     @board.taken?(win_combination[0]+1)
   end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won = won?
      @board.cells[won.first]
    end
  end

  def turn
    @board.display
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move) == true
      @board.update(current_move, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
