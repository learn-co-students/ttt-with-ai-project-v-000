class Game
attr_accessor :player_1, :player_2

def board
@board


end

def board= (board)
@board = board
end


def initialize (player_1 = Players::Human.new("X") ,player_2 = Players::Human.new("O"), board = Board.new)
@board = board
@player_1 = player_1
@player_2 = player_2
end





#----------------------------------------------------
#here's a constant that defines all win combinations
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]

]


#--------------------------------------------------------
#input to index converts the input from string to integer
#and updates it from a "board index" to an array index (-1)
def input_to_index (move)
  #note that with #to_i, if there are no ints, it will eval
  #to zero and the method will return -1 as a result
return move.to_i - 1
end

#--------------------------------------------------------
def turn

#gets move
puts "Please enter 1-9 player:"
current_move_index = input_to_index(gets.strip)

  #checks validity of move and if it passes, displays it, otherwise
  #re-prompts user to enter a valid move
  if valid_move?(current_move_index)
  move(current_move_index,current_player)
  display_board
  # puts "Gutsiest move I ever saw, Mav."
  else
    turn
  end

end

#--------------------------------------------------------
def turn_count
  total_turns = @board.cells.count("X") + @board.cells.count("O")
  return total_turns
end

#--------------------------------------------------------
def current_player
  if  turn_count.even?
     return @player_1
  elsif @board.cells.count(@player_1.token) > @board.cells.count(@player_2.token)
    return @player_2
  elsif @board.cells.count(@player_1.token) < @board.cells.count(@player_2.token)
    return @player_1
  end
end

#----------------------------------------------------
def won?
  x_spots = @board.each_index.select {|i| @board[i] == "X"}
  o_spots = @board.each_index.select {|i| @board[i] == "O"}
  is_a_win = false



    #for each of the winning arrays, do any these sets of 3 spots all exist in the filled x/o spots
    #if the 3 spots from any of the win arrays are all found in the x spots (each one is checked below)
    #then this will return true
    x_win = WIN_COMBINATIONS.each { |current_win_array|
    #so for this current win array (1 of the 8 possible wins in win_combinations)
    #are #all? of its elements #included? in the x_spots
    #only if all of the win array spots are found in x_spots, will it return true
    if current_win_array.all? { |current_win_spot| x_spots.include?(current_win_spot) }
      is_a_win = current_win_array
    end

    }


    #exact same but for o
    o_win = WIN_COMBINATIONS.each { |current_win_array|

      if current_win_array.all? { |current_win_spot| o_spots.include?(current_win_spot) }
        is_a_win = current_win_array
      end

    }

  #note this leverages ruby's unique truthiness and dynaimc
  #typing so it's not entirely  future proof
  if is_a_win.class == Array
    return is_a_win
  elsif is_a_win == false
    return is_a_win
  end

end



#----------------------------------------------------
def full?
  #if any of the elements are blank, it will return true, which means it will be not full
  return !@board.any? {|x| x == " "}
end



#----------------------------------------------------
def draw?
  #it's a draw if the board does not have a win and it's full; otherwise, not a draw
  return !won? && full?
end




#----------------------------------------------------
def over?
  return won? || draw? || full?
end




#----------------------------------------------------
def winner

   #this leverages ruby truthiness, where an array returned evaluates to truthy
  won? ? (return @board[won?[0]]) : (return nil)

end


#--------------------------------------------------------
def play

  #keep calling turns until the game is #over?
  #changed to until to make it a bit more semantic here
  #should be functionally identical to while
  (turn) until over?

  won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")


end

#the end of the class (below)
end
