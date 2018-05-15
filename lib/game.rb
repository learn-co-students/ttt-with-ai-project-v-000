class Game

  attr_accessor :board, :player_1, :player_2, :winner

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

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player()
  @board.turn_count % 2 == 0 ? player_1 : player_2
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
    @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
    (@board.cells[win_combination[0]] == "X" || @board.cells[win_combination[0]] == "O")
  end

end

def draw?
  @board.full? && !won?
end

def over?
  won? || draw?
end


def winner
  if win_arr = won?
    @winner = @board.cells[win_arr.first]
  end
end

def turn
# ask user to enter no between 1-9
# player_1 shall get his turn
# if invalid no ask player_1 to play again
# after valid player_1 turn
# change to player_2 for his turn
#

puts "Please enter a number 1-9:"
  @user_input = current_player.move(@board)
  if @board.valid_move?(@user_input)
    @board.update(@user_input, current_player)
  else
    puts "Please enter a number 1-9:"
    @board.display
    turn
  end
  @board.display

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
