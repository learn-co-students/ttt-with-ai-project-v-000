class Board

attr_accessor :cells #has an attribute to store the cells of the board

def initialize(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]) #sets the cells of the board to a 9 element array of " "
  @cells = cells
end

def reset!   #can reset the state of the cells in the board
  @cells.clear #
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #sets the cells of the board to a 9 element array of " "
end
# The #reset! method can reset the state of the cells to what a board should look like at the start of a game, an array with 9 " " elements.
# When a board is initialized, it should start with cells for a new game of Tic-tac-toe.

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end
  #A board can print its current state with the `#display` method.

  def position(input)
    @cells[input.to_i-1]
  end
  #takes in user input and returns the value of the board cell

def full?
  @cells.all? { |i| i != " " }
end  #board can return values based on its state such as `#full?` when entirely occupied with "X" and "O"s


def turn_count
  @cells.count { |i| i != " "}
end #how many positions in the cells array are filled

def taken?(input)
@cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
end #will return true or false for an individual position

def valid_move?(input)
  input.to_i.between?(1,9) && !taken?(input)
end
  #will ensure that moves are between 1-9 and not taken

def update(position, player)
  @cells[position.to_i - 1] = player.token
end

end
