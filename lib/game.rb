class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Middle column
  [2,5,8],  # Last column
  [0,4,8],  # diagnoal one
  [2,4,6]  # last diagnal
]

 def initialize(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board  = board
 end

 #def board
  # @board
 #end

 def current_player
   if self.board.turn_count % 2 == 0
     player_1
   else
     player_2
   end
 end

 def won?
   WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board.cells[win_index_1]
    position_2 = board.cells[win_index_2]
    position_3 = board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
      else
   	  end # end if
      end # end each
      return false

 end #end method

 def full?
   if @board.cells.include?(" ")
     false
   else
     true
   end
 end #ends full


 def draw?
  if full? && !won?
    true
  end
end #ends draw?

  def over?
    if won?
    true
  elsif draw?
    true
  end #ends if
  end

  def winner
  if won?
    true
    WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board.cells[win_index_1]
     position_2 = board.cells[win_index_2]
     position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
      elsif position_1 == "O"  && position_2 == "O" && position_3 == "O"
      return "O"
      end #end if
    end #end each/do block
  end #end if statement
end #end win_combinations

def turn
  #store our current player's move
  player = current_player.move(board)
    if board.valid_move?(player)
      board.update(player, current_player)
      board.display
    else
      turn
  end
end

def move(index, current_player)
  board.cells[index] = current_player
end

def play
  puts "Please enter 1-9:"

  until over?
    turn
  end #ends until loop
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else draw?
    puts "Cat's Game!"
  end #ends if statement
end #ends def

end #ends class
