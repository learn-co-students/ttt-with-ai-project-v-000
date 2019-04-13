require 'pry'
class Game
attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
        [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [6,4,2]
          ]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
end

def current_player
  board.turn_count % 2 == 0 ? @player_1 : @player_2
end

def won?
  WIN_COMBINATIONS.detect do |iterator|
    board.cells[iterator[0]] == board.cells[iterator[1]] &&
    board.cells[iterator[1]] == board.cells[iterator[2]] &&
    board.taken?(iterator[0]+1)
  end
end

def draw?
  board.full? && !won?
end

def over?
  won? || draw?
end

def winner
  the_win = won?
  if the_win
   winner = board.cells[the_win[0]]
  end
end


def turn
  player = current_player
  current_move = player.move(board)
  if !board.valid_move?(current_move)
    turn
  else
    board.display
    board.update(current_move, player)
    board.display
  end
end

 def play
   while !over?
     turn
   end
     if draw?
       puts "Cats Game!"
     elsif won?
       puts "Congratulations #{winner}!"
     end
   end

end
