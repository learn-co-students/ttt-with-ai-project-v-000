require 'pry'
class Board


#--------------------------------------------------------
def initialize()
@cells = []
reset!
display('Display')
end


def cells
@cells
end

def cells= (new_array)
@cells = new_array
end

#--------------------------------------------------------
def display(board_type = 'Active')
  width = 3
  total_cells = 9

    @cells.each_index { |i|
      if board_type == 'Active'
      print " #{@cells[i]} "

      elsif board_type == 'Display'
      print " #{i+1} "

      else
      print " #{@cells[i]} "

      end


      if i+1 == total_cells
      print "\n"

      elsif (i+1) % width == 0
      print "\n-----------\n"

      elsif i+1 % width != 0 && i+1 != total_cells
      print "|"

      end
    }
end


#--------------------------------------------------------
def reset!
@cells = [" "," "," "," "," "," "," "," "," "]

end


#--------------------------------------------------------
#input to index converts the input from string to integer
#and updates it from a "board index" to an array index (-1)
def input_to_index (move)
  #note that with #to_i, if there are no ints, it will eval
  #to zero and the method will return -1 as a result
return move.to_i - 1
end


def position (move)
@cells[input_to_index(move)]    
end

#--------------------------------------------------------
def taken? (input)
index = input_to_index(input)
@cells[index] == 'X' || @cells[index] == 'O' ? (return true) : (return false)
end

def available_cells
indices_of_available_cells = []
@cells.each_with_index {|value,index|
                        if value == " "
                        indices_of_available_cells << index  
                      end
                        }
indices_of_available_cells
end

#--------------------------------------------------------
def valid_move? (input)
index = input_to_index(input)
  spot_on_board = (index < 9 && index > -1)
  is_taken = taken?(input)
  return spot_on_board && !is_taken
end

#--------------------------------------------------------
def turn

#gets move
puts "Please enter 1-9 player:"
current_move = gets.strip
current_move_index = input_to_index(current_move)

  #checks validity of move and if it passes, displays it, otherwise
  #re-prompts user to enter a valid move
  if valid_move?(current_move_index)
  update(current_move_index,current_player)
  display_board
  # puts "Gutsiest move I ever saw, Mav."
  else
    turn
  end

end


#--------------------------------------------------------
def turn_count
  total_turns = @cells.count("X") + @cells.count("O")
  return total_turns
end

#--------------------------------------------------------
def update (input, player)
position = input_to_index(input)
@cells[position] = player.token
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
  !@cells.any? {|x| x == " "}
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


end


