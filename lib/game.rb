class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first vertical column
  [1,4,7], #second vertical column
  [2,5,8], #third vertical column
  [0,4,8], #diagonal top left to bottom right
  [2,4,6] #diagonal top right to bottom left
]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def board
  @board
end

def current_player
  if @board.turn_count.even?
    @player_1
  else
    @player_2
  end
end

def over?
  won? || draw?
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return win_combination     # return the win_combination indexes that won.
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

def draw?
  !won? && @board.full?
end

def winner
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      false
    end
  end
end

def turn
  user = self.current_player
  new_move = user.move(@board)
  #new_move = user.move(@board)
  if @board.valid_move?(new_move)
    @board.update(new_move, user)
    @board.display
  else
    turn
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
