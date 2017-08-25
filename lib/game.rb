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

 def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board=Board.new )
   @player_1= player_1
   @player_2 = player_2
   @board = board
 end

 def current_player
  if  board.turn_count.odd?
     @player_2
   else
      @player_1
    end
  end

  def over?
   won? || draw?
end

def draw?
  @board.full? && !won?
end

def won?
   WIN_COMBINATIONS.detect do |win|
        @board.cells[win[0]] == @board.cells[win[1]] &&
        @board.cells[win[1]] == @board.cells[win[2]] &&
        @board.cells[win[0]] != " "
      end
    end
    def winner
    if winning_combination = won?
    @winner =  @board.cells[winning_combination.first]
    end
  end

  def turn
    current_move = current_player.move(board)
    if !@board.valid_move?(current_move)
      turn  
     else
       @board.update(current_move, current_player)
       @board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end



end
