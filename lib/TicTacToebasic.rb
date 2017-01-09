class TicTacToe

 def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
   @board = board
 end

 WIN_COMBINATIONS = [

 [0,1,2], # top row
 [3,4,5], # middle row
 [6,7,8], # bottom row

 [0,3,6], # left column
 [1,4,7], # middle column
 [2,5,8], # right column

 [0,4,8], # diagonal left
 [2,4,6] # diagonalright
 ]

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move(index, current_player)
   @board[index] = current_player
 end

 def position_taken?(index)
 @board[index] == "X" || @board[index] == "O"
 end

 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end

 def turn_count
   counter = 0
   @board.each do |turns|
     if turns == "X" || turns == "O"
       counter += 1
     end
   end
   counter
 end

 def current_player
   if turn_count % 2 == 0
      "X"
   else turn_count % 2 == 1
      "O"
   end
 end

 def turn
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(index)
     move(index, current_player)
     display_board
   else
     turn
   end
 end

 def won?
   WIN_COMBINATIONS.detect do |win_combo|
     @board[win_combo[0]] == @board[win_combo[1]] &&
     @board[win_combo[1]] == @board[win_combo[2]] &&
     position_taken?(win_combo[0])
   end
 end

 def full?
 @board.all? do |position|
   position == "X" || position == "O"
 end
 end

 def draw?
   !won? && full?
 end

 def over?
   won? || draw?
 end

 def winner
 if win_combo = won?
   @board[win_combo[0]]
 end
 end

 def play
  turn until over?
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end

end