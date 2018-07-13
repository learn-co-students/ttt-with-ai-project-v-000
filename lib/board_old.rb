# class Board
#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2]
#   ]
#
#   def initialize(board = nil)
#     i = Array.new(9, " ")
#   end
#
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
#
#   def input_to_index(move)
#      index = move.to_i - 1 # Declares the index variable, changes it to an integer and -1 to correspond to the array indexes
#      index
#   end
#
#   def move(position, token = "X")
#     @board[position] = token
#   end
#
#   def position_taken?(position)
#     @board[position] == "X" ||
#     @board[position] == "O"
#   end
#
#   def valid_move?(position)
#     if position.between?(0,8) && !position_taken?(position)
#     return true
#     else
#     false
#     end
#   end
#
#   def turn
#     puts "Your turn"
#     input = gets.strip
#     index = input_to_index(input)
#     if valid_move?(index) == true
#       move(index, current_player)
#     else
#       puts "invalid, try again"
#       turn
#     end
#     display_board
#   end
#
#   def turn_count
#     @board.count do |token|
#       token == "X" || token == "O"
#     end
#   end
#
#   def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end
#
#   def won?
#     WIN_COMBINATIONS.each do |combo|
#       if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
#         return combo
#       elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
#         return combo
#       end
#     end
#     return false
#   end
#
#   def full?
#     !@board.include?(" ")
#   end
#
#   def draw?
#     full? && !won?
#   end
#
#   def over?
#     won? || full? || draw? #ugh shouldn't have to do this
#   end
#
#   def winner
#     won? ? @board[won?[0]] : nil
#   end
#
#   def play
#     until over?
#       turn
#   end
#
#     if won?
#       puts "Congratulations #{winner}!"
#     else
#       puts "Cat's Game!"
#     end
#   end
#
# end
