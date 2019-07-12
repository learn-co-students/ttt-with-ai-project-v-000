# The Board class represents the data and logic of a Tic-tac-toe game board. It has a property, cells, that stores the data of the state of the board in an array.

class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

# The #reset! method can reset the state of the cells to what a board should look like at the start of a game, an array with 9 " " elements.

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

# A board can print its current state with the #display method.

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

# build a #position method that takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective. All other methods will take input in the user's perspective of 1-9 strings and use #position to look up the value according to the cells' array index.

  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
   #update updates the cells in the board with the player token according to the input. method will take two arguments, the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index, along with the player object making the move. When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the #token method on the player.
  
  
  def update(position, token)
    cells[position.to_i - 1] = token
    display
  end

# Finally, a board can return values based on its state such as #full? when entirely occupied with "X" and "O"s and a #turn_count based on how many positions in the cells array are filled. 

  def full?
    @cells.all? {|x| x != " "}
  end

# a #turn_count based on how many positions in the cells array are filled. 

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end


# def turn_count
# 	turn = 0
# 	@board.each do |turn|
# 		if turn == "X"
# 			turn += 1
# 		elsif turn == "O"
# 			turn += 1
# 		end
# 	end
#  	return turn
# end

##taken? will return true or false for an individual position.

  # def taken?(position)
  #   cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
  # end

   def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

##valid_move? will ensure that moves are between 1-9 and not taken.

  # def valid_move?(position)
  #   !(taken?(position)) && (0..9).include?(position.to_i - 1)
  # end
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
    
    