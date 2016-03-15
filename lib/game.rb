require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],#WIN_COMBINATIONS[0]
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
      else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do|win_combination|

      @board.taken?(win_combination[0]+1) && @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]]
  end
  end

  def full?
  @board.cells.all? do|i|
    i == "X" || i== "O"
end
end

  def draw?
    !won? && full?
  end

  def over?
   won? || draw?
  end


   def winner
     if winning_combo = won?
       @winner = @board.cells[winning_combo[0]]
     end
   end


 def turn
    player = current_player
    input = player.move(board)

  if @board.valid_move?(input)
    @board.update(input,player)

  else
    turn
   end
 end


  def play
    #binding.pry
     while !over?
       turn
    end

    if won?
       #binding.pry
       puts "Congratulations #{winner}!"
     else draw?
       puts "Cats Game!"
     end
  end



end