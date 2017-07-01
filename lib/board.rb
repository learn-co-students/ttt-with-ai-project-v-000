class Board
  attr_accessor :cells
  attr_reader :token
# Board #cells has an attribute to store the cells of the board
  def self.cells
    @@cells
    @token = token
  end

# Board #reset! can reset the state of the cells in the board
# Board #reset! sets the cells of the board to a 9 element array of " "
  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

# Board #initialize sets the cells of the board to a 9 element array of " "
  def initialize
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

# Board #display prints the board
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

# Board #position takes in user input and returns the value of the board cell
  def position(input)
    index = input.to_i - 1
    "#{cells[index]}"
  end

# Board #full? returns true for a full board
# Board #full? returns false for an in-progress game
  def full?
    cells.none? do |i|
      i == " " || i.nil?
    end
  end

# Board #turn_count returns the amount of turns based on cell value
  def turn_count
    count = 0
    cells.each do |play|
      if play == "X" || play == "O"
        count += 1
      end
    end
    count
  end

# Board #taken? returns true if the position is X or O
# Board #taken? returns false if the position is empty or blank
  def taken?(input)
    index = input.to_i - 1
    !(self.cells[index].nil? || self.cells[index] == " ")
  end

# Board #valid_move? returns true for user input between 1-9 that is not taken
  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !taken?(input)
  end

# Board #update updates the cells in the board with the player token according to the input
  def update(input, player)
    index = input.to_i - 1
    self.cells[index] = "X"
  end
end
