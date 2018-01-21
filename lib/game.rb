class Game
 attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
          #defines a contant WIN_COMBINATIONS with arrays for each win Combination
    [0,3,6],
    [1,4,7],
    [2,5,8],

    [0,4,8],
    [2,4,6]
  ]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
  if board.turn_count.odd?
    @player_2
  else
    @player_1
  end
end

def won?
    WIN_COMBINATIONS.detect do |combo|
     @board.cells[combo[0]] == @board.cells[combo[1]] &&
     @board.cells[combo[1]] == @board.cells[combo[2]] &&
     @board.taken?(combo[0]+1)
  end
 end

   def draw?
     if @board.full? && !won?
       true
     end
   end

   def over?
     draw? || won?
   end

def winner
  if combo = won?
    board.cells[combo[0]]
  end
end

def turn
  board.display
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def play
    turn until over? || draw?
      if draw?
        puts "Cat's Game!"
      elsif over? && won?
        puts "Congratulations #{winner}!"
      end
  end
  
end
