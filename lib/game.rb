class Game
  attr_accessor :board, :player_1, :player_2
  
    WIN_COMBINATIONS= [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st col
    [1,4,7], #2nd col
    [2,5,8], #3rd col
    [0,4,8], #left diagonals
    [2,4,6], #right diagonals
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board  = board
  end
 
   def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Please try again"
      turn
    end
    board.display
   end

  def turn_count
    turns = 0
    board.cells.each do |spot|
      if spot == player_1.token || spot == player_2.token
        turns += 1
      end
    end
    turns
  end

  def current_player
    turn_count % 2 == 0 ? player_1 : player_2
  end

 

  
 
  
  
  
  
  
  
  
  
  
  
  
# end of class  
end