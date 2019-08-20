class Game
attr_accessor :board, :player_1,:player_2

WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

 def initialize (player_1 =Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
   @board=board
   @player_1=player_1
   @player_2=player_2
  end

def current_player
   if board.turn_count.even?
     current_player=@player_1
   else
     current_player=@player_2
   end
 end

 def won?
  WIN_COMBINATIONS.detect {|combo| board.taken?(combo[0]+1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]}
end


def draw?
  board.full? && !won?
end

def over?
   won? || draw?
end

def winner
   if combo = won?
     @board.cells[combo[0]]
   end
  end

  def turn
    current_p=current_player
    input=current_p.move(board)
    if board.valid_move?(input)
      board.update(input, current_p)
      board.display
      else
      turn
    end
  end

  def play
    turn until over?

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
         puts "Cat's Game!"
      end
    end
  end
