class Game
  #Players::Human Human.new("X")
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row, #had extra comma&deleted comma, #add comma to delineate element of array WIN_COMBINATIONS
    [3,4,5],  # Middle row, #add comma to delineate element of array WIN_COMBINATIONS
    [6,7,8],  # last row#add comma to delineate element of array WIN_COMBINATIONS
    [0,3,6], #first columns#add comma to delineate element of array WIN_COMBINATIONS
    [1,4,7],  #second columns#add comma to delineate element of array WIN_COMBINATIONS
    [2,5,8],  # third columns#add comma to delineate element of array WIN_COMBINATIONS
    [0,4,8],  #diagnoal from nw to se#add comma to delineate element of array WIN_COMBINATIONS
    [2,4,6],  #diagnoal from ne to sw#add comma to delineate element of array WIN_COMBINATIONS
    # ETC, an array for each win combination#add comma to delineate element of array WIN_COMBINATIONS
  ]
 def current_player
    current_player = Players::Human.new("X")
 end
 def won?(board) WIN_COMBINATIONS.find do |win|
   #FIND the 1 unique combination in the constant WIN_COMBINATIONS
   #when its constant argument,win, is assigned to the board array as part of a local variable
   #that if it passes the logic test of a winning combination, it returns the
   #winning combination indexes' values
 #binding.pry
     position_1 = board[win[0]]
     position_2 = board[win[1]]
     position_3 = board[win[2]]
     if position_1 == position_2 && position_2 == position_3 && position_1 != " "
       #|| position_1 == position_3
          return win
     #elsif position_1 == "X" && position_2 == "O" && position_3 == "X"
         #return true
         else
           false
     end
                         end
 end
 #accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full,
 #and false if the board is won. You should be able to compose this method solely using the methods you used above with some ruby logic
 def draw?(board)
   if !won?(board) && full?(board)
     true
   else
     false
   end
 end
 def full?(board) #defines the full? method w/board array
   board.all? { |elem| # iterate through ALL of the board array
     elem == "X"  || elem == "O" || elem != " "#value is comparable to X OR O OR is not empty
   }
 end
 def over?
   if !won?(board) && full?(board) || won?(board)
     true
   else
     false
 end
end
end
