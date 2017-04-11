class Game
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row, #had extra comma&deleted comma, #add comma to delineate element of array WIN_COMBINATIONS
    [3,4,5],  # Middle row, #add comma to delineate element of array WIN_COMBINATIONS
    [6,7,8],  # last row#add comma to delineate element of array WIN_COMBINATIONS
    [0,3,6], #first columns#add comma to delineate element of array WIN_COMBINATIONS
    [1,4,7],  #second columns#add comma to delineate element of array WIN_COMBINATIONS
    [2,5,8],  # third columns#add comma to delineate element of array WIN_COMBINATIONS
    [0,4,8],  #diagnoal from nw to se#add comma to delineate element of array WIN_COMBINATIONS
    [2,4,6],  #diagnoal from ne to sw#add comma to delineate element of array WIN_COMBINATIONS
  ]
 def current_player
    current_player = Players::Human.new("X")
 end
 def won?
   WIN_COMBINATIONS.find do |win|
     position_1 = board.cells[win[0]]
     position_2 = board.cells[win[1]]
     position_3 = board.cells[win[2]]
     position_1 == position_2 && position_2 == position_3 && position_1 != " "
   end
 end
 def draw?
    !won? && full?
 end
 def full?
   board.cells.all? { |elem|
     elem == "X"  || elem == "O" || elem != " "
   }
 end
 def over?
    !won? && full? || won?
 end
 def winner
   win = won?
   return if win.nil?
   position_1 = board.cells[win[0]]
   position_2 = board.cells[win[1]]
   position_3 = board.cells[win[2]]
   if position_1 == "X"
     return "X"
   elsif position_1 == "O"
     return "O"
   else
     false
   end
 end
 def display_board
   puts " #{board.cells[0]} | #{board.cells[1]} | #{board.cells[2]} "
   puts "-----------"
   puts " #{board.cells[3]} | #{board.cells[4]} | #{board.cells[5]} "
   puts "-----------"
   puts " #{board.cells[6]} | #{board.cells[7]} | #{board.cells[8]} "
 end
 def input_to_index(user_input)
   user_input.to_i-1
 end

 def move
   board.cells[index] = current_player
   #updated board entries in one line w/ 3 arguments = placeholder for values in the bin/move file
 end
 def valid_move?
   board.cells.index.between?(0,8) && !position_taken?#To get the index of an array item, use the index method
 end
 def position_taken?
   if board.cells[index] == "" || board.cells[index] == " "|| board.cells[index] == nil
     false
   else #board[index] == "X" || "O"
     true
   end
 end
 def turn
   puts "Please enter 1-9:"
   input= gets
   input= input_to_index(input)
   if valid_move?
     move
     display_board
   elsif
     turn #here is the missing line for 9-12 pm
   end
 end
end
